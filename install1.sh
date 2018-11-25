#!/bin/bash
# * @package deepin-refresh
# * @author Lyvnee
# * @version 0.1
# * @license MIT
# * @link http://lyvnee.com

echo "==========Start!=========="
dirname="$HOME/.config/deepin/dde-file-manager/menuextensions"
if [ ! -d  $dirname ];then
  echo "Creating menuextensions dir!"
  mkdir -p $dirname
else
  echo "Menuextensions dir exist!"
fi
echo "Creating refresh.json!"
touch $dirname/refresh.json
echo  "[" > $dirname/refresh.json
echo   "  {" >> $dirname/refresh.json
echo   "      \"MenuType\": \"EmptyArea\"," >> $dirname/refresh.json
echo   "      \"Icon\": \"\"," >> $dirname/refresh.json
echo   "      \"Text\": \"Refresh\"," >> $dirname/refresh.json
echo   "      \"Text[zh_CN]\": \"刷新\"," >> $dirname/refresh.json
echo   "      \"Exec\": \"deepin-refresh\"" >> $dirname/refresh.json
echo   "  }" >> $dirname/refresh.json
echo   "]" >> $dirname/refresh.json
echo "Creating deepin-refresh!"
sudo touch /usr/bin/deepin-refresh
sudo sh -c "echo \"#!/bin/bash\" > /usr/bin/deepin-refresh"
sudo sh -c "echo \"#xte 'keydown Multi_key' 'key F5' 'keyup Multi_key'\" >> /usr/bin/deepin-refresh"
sudo sh -c "echo \"xte 'key F5'\" >> /usr/bin/deepin-refresh"

sudo chmod 755 /usr/bin/deepin-refresh
echo "Installing xautomation!"
sudo apt install xautomation -y
echo "==========Finished!=========="
