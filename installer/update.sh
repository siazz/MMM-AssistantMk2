#!/bin/bash
# +--------------------------------+
# | updater                        |
# | AMK2 v3 Installer by Bugsounet |
# | Rev 1.0.1                      |
# +--------------------------------+
# get the installer directory
Installer_get_current_dir () {
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  echo "$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

Installer_dir="$(Installer_get_current_dir)"

# move to installler directory
cd "$Installer_dir"
source utils.sh
Installer_info "Welcome to AMk2 updater !"
echo

cd ~/MagicMirror/modules/MMM-AssistantMk2
# deleting package.json because npm install add/update package
rm -f package.json
rm -f package-lock.json
Installer_info "Updating..."
git pull
#fresh package.json
git checkout package.json
cd ~/MagicMirror/modules/MMM-AssistantMk2/node_modules
Installer_info "Deleting ALL @bugsounet libraries..."
rm -rf @bugsounet
cd ~/MagicMirror/modules/MMM-AssistantMk2
Installer_info "Ready for Installing..."
# launch installer
npm install
