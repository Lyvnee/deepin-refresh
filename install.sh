#!/bin/bash

echo "==========Start!=========="
dirname="$HOME/.config/deepin/dde-file-manager/menuextensions"
if [ ! -d  $dirname ];then
  mkdir -p $dirname
else
  echo "Menuextensions dir exist!"
fi
cp $(cd `dirname $0`; pwd)/refresh.json $dirname/refresh.json
sudo cp $(cd `dirname $0`; pwd)/deepin-refresh /usr/bin/deepin-refresh
sudo chmod 755 /usr/bin/deepin-refresh
sudo apt install xautomation -y
echo "==========Finished!=========="
