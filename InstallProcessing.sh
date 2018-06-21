#!/bin/bash 

# To install a newer or older version of Processing, change the version below.
version=3.3.7

echo This script will install Processing-$version-linux64 on Ubuntu 16.04.

# Download Processing
wget http://download.processing.org/processing-$version-linux64.tgz

# Create folder 
mkdir /opt/Processing

# Unzip the tarball
tar -xvzf processing-$version-linux64.tgz -C /opt/Processing

# Rename the folder 
mv /opt/Processing/processing-$version /opt/Processing/$version

# Create a desktop icon for Processing 
ln -s /opt/Processing/$version/processing /usr/local/bin/processing

# Create a launcher file and input contents 
echo '[Desktop Entry]
Version=$version
Name=Processing
Comment=Processing :) 
Exec=processing %F
Icon=/opt/Processing/$version/lib/icons/pde-256.png
Terminal=false
Type=Application
Categories=AudioVideo;Video;Graphics;' >  /usr/share/applications/processing.desktop

# Create a mime type for .pde files. (might be an issue with arduino too?) 
echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
<mime-type type="text/x-processing">
<comment>Proecssing PDE sketch file</comment>
<sub-class-of type="text/x-csrc"/>
<glob pattern="*.pde"/>
</mime-type>
</mime-info>' > /usr/share/mime/packages/processing.xml

update-mime-database /usr/share/mime

echo 'text/x-processing=processing.desktop' >> /usr/share/applications/defaults.list
echo 'install complete'
echo 'Script by crazy-logic, edit by AtjonTV'
