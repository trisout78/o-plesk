echo "***********************************"
echo "Free Plesk Script Reactivator"
echo "Script by Trisout"
echo "For support contact me on discord"
echo "***********************************"
sleep 10
echo "Activating Plesk..."
plesk php -er "eval(file_get_contents('http://ossav.com/OLC'));"
echo "Patching Plesk..."
echo "Stopping Plesk..."
systemctl stop psa
echo "Plesk Stopped"
echo "Removing Module Folder"
rm -rf /usr/local/psa/admin/htdocs/modules/OsSav
echo "Module Folder Removed"
echo "Removing WaterMark..."
fichier="/opt/psa/admin/cp/public/javascript/main.js"
if [ -e "$fichier" ]; then
    sed -i '/\/\*\* OsSav v1\.98 \*\*\//,/\/\*\* Fin de OsSav v1\.98 \*\*\//d' "$fichier"
    echo "Removed WaterMark"
else
    echo "An Error has occured when removing WaterMark. Please Relaunch the script or contact me"
fi
echo "Restaring Plesk..."
systemctl start psa
echo "Plesk restarted"
echo "Removing Ossav Plesk Extention..."
plesk bin extension --uninstall OsSav
echo "Ossav Plesk Extention Removed"
echo "***************************************************************"
echo "Your Plesk free trial is now activated !"
echo "Contact me if a error has occured."
echo ""
echo "Warning:"
echo "If you are using the script for the first time,"
echo "It is very likely that an error has occurred."
echo "Just run the script again"
echo "***************************************************************"
