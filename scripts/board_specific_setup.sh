#!/bin/bash
. $(dirname ${BASH_SOURCE[0]})/fydeos_version.sh
CHROMEOS_ARC_ANDROID_SDK_VERSION=28
CHROMEOS_ARC_VERSION=7441130
CHROMEOS_VERSION_AUSERVER=https://up.fydeos.com/service/update2
CHROMEOS_VERSION_DEVSERVER=https://devserver.fydeos.com:9999
CHROMEOS_VERSION_TRACK=stable-channel
#CHROMEOS_PATCH=${CHROMEOS_PATCH##*_}
CHROMEOS_PATCH=15
if [ -n "${CHROMEOS_BUILD}" ]; then
  CHROMEOS_VERSION_STRING="${CHROMEOS_BUILD}.${CHROMEOS_BRANCH}.${CHROMEOS_PATCH}.$(get_build_number ${CHROMEOS_PATCH})"
  export FYDEOS_RELEASE=$(get_fydeos_release_version)
fi
skip_blacklist_check=1
skip_test_image_content=1
FLAGS_boot_args="${FLAGS_boot_args} audit=0"
