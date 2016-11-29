#!/bin/bash

THEME="Arc-Dark"
DESKTOP="$(xdg-user-dir DESKTOP)"

xfconf-query -n -c xsettings -p /Net/ThemeName -t string -s "$THEME"
xfconf-query -n -c xsettings -p /Net/IconThemeName -t string -s Arc

xfconf-query -n -c xfwm4 -p /general/theme -t string -s "$THEME"
xfconf-query -n -c xfwm4 -p /general/use_compositing -t bool -s true
xfconf-query -n -c xfwm4 -p /general/show_frame_shadow -t bool -s true
xfconf-query -n -c xfwm4 -p /general/show_popup_shadow -t bool -s true
xfconf-query -n -c xfwm4 -p /general/workspace_count -t int -s 2

xfconf-query -n -c keyboards -p /Default/Numlock -t bool -s true

xfconf-query -n -c xfce4-panel -p /panels/panel-1/nrows -t int -s 2
xfconf-query -n -c xfce4-panel -p /panels/panel-2/autohide -t bool -s true
xfconf-query -n -c xfce4-panel -p /plugins/plugin-1/show-button-title -t bool -s false
xfconf-query -n -c xfce4-panel -p /plugins/plugin-1/button-icon -t string -s debian-logo
xfconf-query -n -c xfce4-panel -p /plugins/plugin-4/rows -t int -s 2

mkdir -p "$HOME/.local/share/applications/"
xdg-mime default Thunar.desktop inode/directory
xdg-mime default mousepad.desktop text/css text/csv text/html text/plain text/xml text/x-h text/x-c
xdg-mime default ristretto.desktop image/png image/gif image/jpeg image/bmp image/x-pixmap image/tiff image/svg+xml image/x-xpixmap
xdg-mime default evince.desktop application/pdf application/x-bzpdf application/x-gzpdf application/x-xzpdf application/x-ext-pdf application/postscript application/x-bzpostscript application/x-gzpostscript image/x-eps image/x-bzeps image/x-gzeps application/x-ext-ps application/x-ext-eps application/x-dvi application/x-bzdvi application/x-gzdvi application/x-ext-dvi image/vnd.djvu application/x-ext-djv application/x-ext-djvu image/tiff application/x-cbr application/x-cbz application/x-cb7 application/x-cbt application/x-ext-cbr application/x-ext-cbz application/x-ext-cb7 application/x-ext-cbt application/oxps application/vnd.ms-xpsdocument
xdg-mime default xarchiver.desktop application/x-arj application/arj application/x-bzip application/x-bzip-compressed-tar application/x-gzip application/x-rar application/x-rar-compressed application/x-tar application/x-zip application/x-zip-compressed application/zip application/x-7z-compressed application/x-compressed-tar application/x-bzip2 application/x-bzip2-compressed-tar application/x-lzma-compressed-tar application/x-lzma application/x-deb application/deb application/x-xz application/x-xz-compressed-tar
cp -f "$HOME/.local/share/applications/mimeapps.list" "$HOME/.config/"

xdg-user-dirs-update
cp /usr/share/applications/{firefox-esr,libreoffice-startcenter,scilab,chromium,kde4/kcalc,exo-terminal-emulator}.desktop "$DESKTOP"
sed -i "s|~|$HOME|g" "$HOME/.cache/atom/atom.desktop"
cp "$HOME/.cache/atom/atom.desktop" "$DESKTOP"
chmod u+x "$DESKTOP"/*

echo "WebBrowser=firefox" > "$HOME/.config/xfce4/helpers.rc"
echo "FileManager=Thunar" >> "$HOME/.config/xfce4/helpers.rc"
echo "TerminalEmulator=xfce4-terminal" >> "$HOME/.config/xfce4/helpers.rc"
#if file exist
#sed -i 's/\(FileManager=\).*/\1Thunar/' $HOME/.config/xfce4/helpers.rc
#sed -i 's/\(TerminalEmulator=\).*/\1xfce4-terminal/' $HOME/.config/xfce4/helpers.rc
#sed -i 's/\(WebBrowser=\).*/\1firefox/' $HOME/.config/xfce4/helpers.rc
