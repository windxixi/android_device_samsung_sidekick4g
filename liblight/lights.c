/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2011 <kang@insecure.ws>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "Sidekick4gLights"
#include <cutils/log.h>
#include <cutils/properties.h>

#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <hardware/lights.h>


static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

//static struct light_state_t g_battery;
//static struct light_state_t g_notification;
static int g_use_charging_light;


/* 
 * In sidekick, there are two leds in stock rom :
 * Led1 supports red && blue, it is used for things like sms notifiton?
 * Led2 supports red && green, it is used for charging notifiton?
*/
char const *const LCD_FILE = "/sys/class/backlight/s5p_bl/brightnesst";
//char const *const LED_FILE = "/sys/class/misc/notification/led";

char const *const KEYBOARD_FILE = "/sys/class/leds/led-qwerty/brightness";

char const *const LED_FILE_RED1 = "/sys/class/leds/led1-red/brightness";
char const *const LED_FILE_RED2 = "/sys/class/leds/led2-red/brightness";
char const *const LED_FILE_BLUE = "/sys/class/leds/led1-blue/brightness";
//char const *const LED_FILE_BLUE2 = "/sys/class/leds/led2-blue/brightness";
char const *const LED_FILE_GREEN = "/sys/class/leds/led2-green/brightness";

/* led blinks */
char const *const BLUE_BLINK = "/sys/class/leds/led1-blue/blinks";
//char const *const BLUE_BLINK = "/sys/class/leds/led2-blue/blinks";
char const *const RED_BLINK1 = "/sys/class/leds/led1-red/blinks";
char const *const RED_BLINK2 = "/sys/class/leds/led2-red/blinks";
char const *const GREEN_BLINK = "/sys/class/leds/led2-green/blinks";

void init_globals(void)
{
	char prop[PROPERTY_VALUE_MAX];

	// init the mutex
	pthread_mutex_init(&g_lock, NULL);

	//   memset(&g_battery, 0, sizeof(g_battery));
	//   memset(&g_notification, 0, sizeof(g_notification));

	property_get("ro.battery_light", prop, "true");
	g_use_charging_light = strcmp(prop, "false") != 0;

}

static int 
write_int(char const *path, int value)
{
	int fd;
	static int already_warned = 0;

	LOGD("write_int: path %s, value %d", path, value);
	fd = open(path, O_RDWR);

	if (fd >= 0) {
		char buffer[20];
		int bytes = sprintf(buffer, "%d\n", value);
		int amt = write(fd, buffer, bytes);
		close(fd);
		return amt == -1 ? -errno : 0;
	} else {
		if (already_warned == 0) {
			LOGE("write_int failed to open %s\n", path);
			already_warned = 1;
		}
		return -errno;
	}
}

static int 
rgb_to_brightness(struct light_state_t const *state)
{
	int color = state->color & 0x00ffffff;

	return ((77*((color>>16) & 0x00ff))
		+ (150*((color>>8) & 0x00ff)) + (29*(color & 0x00ff))) >> 8;
}

static int
is_lit(struct light_state_t const* state)
{
    return state->color & 0x00ffffff;
}

static int 
set_light_backlight(struct light_device_t *dev,
		struct light_state_t const *state)
{
	int err = 0;
	int brightness = rgb_to_brightness(state);

	pthread_mutex_lock(&g_lock);
	err = write_int(LCD_FILE, brightness);

	pthread_mutex_unlock(&g_lock);
	return err;
}

static int
set_light_keyboard(struct light_device_t* dev,
		struct light_state_t const* state)
{
    int err = 0;
    int on = is_lit(state);

    pthread_mutex_lock(&g_lock);
    err = write_int(KEYBOARD_FILE, on ? 255:0);
    pthread_mutex_unlock(&g_lock);

    return err;
}

static int
set_light_battery(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int err = 0;
    int on = is_lit(state);

    pthread_mutex_lock(&g_lock);

    //g_battery = *state;

    if (g_use_charging_light) {
    	err = write_int(LED_FILE_RED1, on ? 255:0);
    }
    pthread_mutex_unlock(&g_lock);

    return err;
}

static int 
set_light_notifications(struct light_device_t* dev,
			struct light_state_t const* state)
{
	int brightness = rgb_to_brightness(state);
	int v = 0;
	int ret = 0;
	pthread_mutex_lock(&g_lock);

	if (brightness+state->color == 0 || brightness > 100) {
		if (state->color & 0x00ffffff) 	v = 1;
	} else {
		v = 0;
	}
	LOGI("color %u fm %u status %u is lit %u brightness", state->color, state->flashMode, v, (state->color & 0x00ffffff), brightness);
	ret = write_int(LED_FILE_RED2, v);
	pthread_mutex_unlock(&g_lock);
	return ret;
}


static int close_lights(struct light_device_t *dev)
{
	LOGV("close_light is called");
	if (dev)
		free(dev);

	return 0;
}

static int open_lights(const struct hw_module_t *module, char const *name,
						struct hw_device_t **device)
{
	int (*set_light)(struct light_device_t *dev,
		struct light_state_t const *state);

	LOGV("open_lights: open with %s", name);

	if (0 == strcmp(LIGHT_ID_BACKLIGHT, name))
		set_light = set_light_backlight;
	else if (0 == strcmp(LIGHT_ID_KEYBOARD, name)) 
		set_light = set_light_keyboard;
	else if (0 == strcmp(LIGHT_ID_BATTERY, name))
        	set_light = set_light_battery;
	else if (0 == strcmp(LIGHT_ID_NOTIFICATIONS, name))
		set_light = set_light_notifications;
	else
		return -EINVAL;

    	pthread_once(&g_init, init_globals);

	struct light_device_t *dev = malloc(sizeof(struct light_device_t));
	memset(dev, 0, sizeof(*dev));

	dev->common.tag = HARDWARE_DEVICE_TAG;
	dev->common.version = 0;
	dev->common.module = (struct hw_module_t *)module;
	dev->common.close = (int (*)(struct hw_device_t *))close_lights;
	dev->set_light = set_light;

	*device = (struct hw_device_t *)dev;

	return 0;
}

static struct hw_module_methods_t lights_module_methods = {
	.open =  open_lights,
};

const struct hw_module_t HAL_MODULE_INFO_SYM = {
	.tag = HARDWARE_MODULE_TAG,
	.version_major = 1,
	.version_minor = 0,
	.id = LIGHTS_HARDWARE_MODULE_ID,
	.name = "sidekick4g lights Module",
	.author = "Google, Inc.",
	.methods = &lights_module_methods,
};


