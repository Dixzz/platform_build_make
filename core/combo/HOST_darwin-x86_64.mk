#
# Copyright (C) 2006 The Android Open Source Project
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

# Configuration for Darwin (Mac OS X) on x86_64.
# Included by combo/select.mk

include $(BUILD_COMBOS)/mac_version.mk

define $(combo_var_prefix)transform-shared-lib-to-toc
$(call _gen_toc_command_for_macho,$(1),$(2))
endef

HOST_SHLIB_SUFFIX := .dylib
HOST_JNILIB_SUFFIX := .jnilib

HOST_GLOBAL_ARFLAGS := cqs

# Use Darwin's libc++, as Darwin's libstdc++ is old and does not support C++11
HOST_SYSTEMCPP_CPPFLAGS := -isystem $(mac_sdk_path)/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
HOST_SYSTEMCPP_LDFLAGS := -stdlib=libc++

# We Reuse the following functions with the same name from HOST_darwin-x86.mk:
# transform-host-o-to-shared-lib-inner
# transform-host-o-to-executable-inner
# get-file-size
