# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

LOCAL_PATH := $(call my-dir)

# This is a "private" module - projects should use "mockito-target" instead!
# It does not provide a MockMaker implementation, hence cannot be used directly.
include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_STATIC_JAVA_LIBRARIES := junit4-target objenesis-target
LOCAL_MODULE := mockito-api
LOCAL_SDK_VERSION := 10
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_JAVA_LIBRARY)

# Main target for dependent projects. Pulls in Mockito and the Dexmaker MockMaker.
include $(CLEAR_VARS)
LOCAL_MODULE := mockito-target
LOCAL_STATIC_JAVA_LIBRARIES := mockito-api dexmaker dexmaker-mockmaker
LOCAL_SDK_VERSION := 10
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_JAVA_LIBRARY)
