#!/bin/sh
#
# InstallCommandLineTool.sh
# Platypus
#
# Created by Sveinbjorn Thordarson on 6/17/08.
#
# Variables herein defined in Common.h
#

echo "Installing command line tool"

# Create directories if they don't exist
echo "Creating directory structures"
mkdir -p "%%CMDLINE_BIN_PATH%%"
mkdir -p "%%CMDLINE_SHARE_PATH%%"
mkdir -p "%%CMDLINE_MANDIR_PATH%%"

# Change to Resources directory of Platypus application, which is first argument
echo "Changing to directory $1"
cd "$1"

echo "Copying resources"
cp "%%CMDLINE_PROGNAME_IN_BUNDLE%%" "%%CMDLINE_TOOL_PATH%%"
cp "%%CMDLINE_SCRIPTEXEC_BIN_NAME%%" "%%CMDLINE_SCRIPT_EXEC_PATH%%"

rm "%%CMDLINE_MANPAGE_PATH%%" &> /dev/null
rm "%%CMDLINE_MANPAGE_PATH%%".gz &> /dev/null
cp "%%CMDLINE_PROGNAME%%.1" "%%CMDLINE_MANPAGE_PATH%%"
gzip "%%CMDLINE_MANPAGE_PATH%%"
cp "%%CMDLINE_DEFAULT_ICON_NAME%%" "%%CMDLINE_ICON_PATH%%"

cp -r "%%CMDLINE_NIB_NAME%%" "%%CMDLINE_SHARE_PATH%%"

echo "Setting permissions"
chmod -R 755 "%%CMDLINE_SHARE_PATH%%"

exit 0