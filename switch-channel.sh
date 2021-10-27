#!/bin/bash
get_cur_dir() {
   pushd $(dirname "${BASH_SOURCE[0]}") >/dev/null 2>&1
   pwd
   popd >/dev/null 2>&1   
}

cur_dir=$(get_cur_dir)
make_tag="channel_config"
make_file=${cur_dir}/make.conf
board_tag="CHROMEOS_VERSION_TRACK"
board_file=${cur_dir}/scripts/board_specific_setup.sh

. $board_file

channels="
    stable
    beta"


print_usage() {
  echo "$(basename $0) [stable | beta] to switch build channel"
  echo "Exist channel:${CHROMEOS_VERSION_TRACK}"
}

getboard() {
  cat ${cur_dir}/metadata/layout.conf |grep repo-name | sed "s/repo-name = //g"      
}

modify_file() {
   local tag=$1
   local data="$2"
   local target_file=$3
   sed -i "s/${tag}=.*$/${tag}=${data}/g" ${target_file} 
}

emerge_packages() {
    ~/trunk/src/scripts/build_packages --board=$(getboard) --nowithautotest    
}

main() {
   local target_channel=$1
   if [ "${target_channel}-channel" == "${CHROMEOS_VERSION_TRACK}" ]; then
      echo "The current channel is already switch to ${target_channel}"
      exit 0
   fi
   for channel in $channels; do
     if [ "$channel" == "$target_channel" ];then
        modify_file $board_tag ${channel}-channel $board_file
	      modify_file $make_tag ${channel}.conf $make_file
        emerge-$(getboard) -C virtual/linux-sources
        emerge_packages
        echo "channel is switched to:${channel}"
        exit 0 
     fi 
   done
   print_usage 
}

main $@
