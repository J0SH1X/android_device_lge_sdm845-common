/*
 * Copyright (C) 2019 The LineageOS Project
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

#define LOG_TAG "TouchscreenGestureService"

#include <fstream>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <cutils/properties.h>

#include "TouchscreenGesture.h"

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

const std::string kGesturePath = "/sys/devices/virtual/input/lge_touch/swipe_enable";

const std::map<int32_t, GestureInfo> kGestureInfoMap_judyln = {
    {0, {249, "Swipe Left"}},
    {1, {250, "Swipe Right"}},
    {2, {248, "Swipe Up"}},
    {3, {247, "Swipe Down"}},
};

const std::map<int32_t, GestureInfo> kGestureInfoMap_judypn = {
    {0, {248, "Swipe Up"}},
    {1, {247, "Swipe Down"}},
    {2, {249, "Swipe Left"}},
    {3, {250, "Swipe Right"}},
};

const std::map<int32_t, GestureInfo> kGestureInfoMap_judyp = {
    {0, {248, "Swipe Up"}},
    {1, {247, "Swipe Down"}},
    {2, {250, "Swipe Right"}},
    {3, {249, "Swipe Left"}},
};

TouchscreenGesture::TouchscreenGesture() {
    char device[PROPERTY_VALUE_MAX];
    property_get("ro.boot.hardware", device, "UNKNOWN");
    
    if(!strcmp(device, "judyln"))
        kGestureInfoMap = kGestureInfoMap_judyln;
    else if(!strcmp(device, "judypn"))
        kGestureInfoMap = kGestureInfoMap_judypn;
    else if(!strcmp(device, "judyp"))
        kGestureInfoMap = kGestureInfoMap_judyp;

}

Return<void> TouchscreenGesture::getSupportedGestures(getSupportedGestures_cb resultCb) {
    std::vector<Gesture> gestures;

    for (const auto& entry : kGestureInfoMap) {
        gestures.push_back({entry.first, entry.second.name, entry.second.keycode});
    }
    resultCb(gestures);

    return Void();
}

Return<bool> TouchscreenGesture::setGestureEnabled(
    const ::vendor::lineage::touch::V1_0::Gesture& gesture, bool enable) {

    std::ofstream file(kGesturePath);
    std::map<int32_t, GestureInfo>::iterator it;
    it = kGestureInfoMap.find(gesture.id);
    if(it == kGestureInfoMap.end()) {
        return false;
    }

    std::string output = std::to_string(it->first) + " " + std::to_string(enable);
    
    file << output;

    return !file.fail();
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
