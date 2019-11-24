#!/bin/bash

# ==============================================================================
# wasta-ibus-postinst.sh
#
# This script is automatically run by the postinst configure step on
#   installation of wasta-ibus.  It can be manually re-run, but is
#   only intended to be run at package installation.  
#
# 2016-06-02 rik: initial script
# 2017-12-20 rik: refactored to handle all ibus setup, not just xkb integration
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
    echo
    echo "You must run this script with sudo." >&2
    echo "Exiting...."
    sleep 5s
    exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Script Entry: wasta-ibus-postinst.sh"
echo

# Setup Diretory for later reference
DIR=/usr/share/wasta-ibus

# ------------------------------------------------------------------------------
# call ibus-xkb-adjustments.sh
# ------------------------------------------------------------------------------
echo
echo "*** Calling ibus-xkb-adjustments.sh script"
echo
bash $DIR/scripts/ibus-xkb-adjustments.sh

# ------------------------------------------------------------------------------
# ibus: set as system-wide default input method
# ------------------------------------------------------------------------------
im-config -n ibus

# ------------------------------------------------------------------------------
# Dconf / Gsettings Default Value adjustments
# ------------------------------------------------------------------------------
# Values in /usr/share/glib-2.0/schemas/z_11_wasta-multidesktop.gschema.override
#   will override Ubuntu defaults.
# Below command compiles them to be the defaults
echo
echo "*** wasta-ibus: updating dconf / gsettings default values"
echo

# MAIN System schemas: we have placed our override file in this directory
# Sending any "error" to null (if key not found don't want to worry user)
glib-compile-schemas /usr/share/glib-2.0/schemas/ # > /dev/null 2>&1 || true;

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Finished with wasta-ibus-postinst.sh"
echo

exit 0
