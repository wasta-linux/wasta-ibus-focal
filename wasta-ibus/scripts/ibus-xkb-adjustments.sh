#!/bin/bash

# ==============================================================================
# wasta-ibus: ibus-xkb-adjustments.sh
#
# 2017-12-20 rik: initial script
# 2018-04-13 rik: Adding xkb:us:talt-intl:eng for use in Mozambique
# 2018-11-13 rik: Adding xkb:kh::kh for Khmer
# 2020-01-24 rik: stopping ibus and restarting if previously running
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
echo "*** Script Entry: ibus-xkb-adjustments.sh"
echo

# Setup Diretory for later reference
DIR=/usr/share/wasta-ibus
IBUS_CONFIG=/usr/share/ibus/component/simple.xml
PIDOF_IBUS=$(pidof ibus-daemon  2>&1 || true;)

# ------------------------------------------------------------------------------
# Ensure ibus not active
# ------------------------------------------------------------------------------

if [ "$PIDOF_IBUS" ];
then
    # stop ibus if it is running
    killall ibus-daemon
fi

# ------------------------------------------------------------------------------
# Add xkb keyboards to ibus-setup
# ------------------------------------------------------------------------------

# Cameroon qwerty: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:qwerty:cm"]' \
    $IBUS_CONFIG

# Cameroon qwerty: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:qwerty:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "qwerty" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (qwerty)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (qwerty keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    $IBUS_CONFIG

# Cameroon azerty: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:azerty:cm"]' \
    $IBUS_CONFIG

# Cameroon azerty: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:azerty:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "azerty" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (azerty)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (azerty keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    $IBUS_CONFIG

# Cameroon Dvorak: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:dvorak:cm"]' \
    $IBUS_CONFIG

# Cameroon Dvorak: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:dvorak:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "dvorak" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (Dvorak)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (Dvorak keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    $IBUS_CONFIG

# Ghana GILLBT: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:gh:gillbt:gh"]' \
    $IBUS_CONFIG

# Ghana GILLBT: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:gh:gillbt:gh" \
    -s //engineTMP -t elem -n language -v "gh" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "gh" \
    -s //engineTMP -t elem -n layout_variant -v "gillbt" \
    -s //engineTMP -t elem -n longname -v "Ghana GILLBT" \
    -s //engineTMP -t elem -n description -v "Ghana GILLBT keyboard" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    /usr/share/ibus/component/simple.xml

# Mozambique Eng Alt International: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:us:talt-intl:eng"]' \
    $IBUS_CONFIG

# Mozambique Eng Alt International: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:us:talt-intl:eng" \
    -s //engineTMP -t elem -n language -v "en" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "us" \
    -s //engineTMP -t elem -n layout_variant -v "talt-intl" \
    -s //engineTMP -t elem -n longname -v "English (US, alternative international)" \
    -s //engineTMP -t elem -n description -v "English (US, alternative international)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "1" \
    -r //engineTMP -v engine \
    $IBUS_CONFIG

# Khmer: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:kh::kh"]' \
    $IBUS_CONFIG

# Khmer: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:kh::kh" \
    -s //engineTMP -t elem -n language -v "kh" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "kh" \
    -s //engineTMP -t elem -n longname -v "Khmer" \
    -s //engineTMP -t elem -n description -v "Khmer" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "1" \
    -r //engineTMP -v engine \
    $IBUS_CONFIG

# ------------------------------------------------------------------------------
# Restart ibus
# ------------------------------------------------------------------------------

if [ "$PIDOF_IBUS" ];
then
    # restart ibus if it was previously running
    ibus-daemon -xrd
fi

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Script Exit: ibus-xkb-adjustments.sh"
echo

exit 0
