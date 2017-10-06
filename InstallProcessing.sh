#!/bin/bash          
          echo This script will install Processing-3.3.6-linux64 on Ubuntu 16.04.


#create folder 
mkdir /opt/Processing

#unzip the tarball
tar -xvzf processing-3.3.6-linux64.tgz -C /opt/Processing

#rename the folder 
mv /opt/Processing/processing-3.3.6 /opt/Processing/3.3.6

#create a desktop icon for Processing 
ln -s /opt/Processing/3.3.6/processing /usr/local/bin/processing

#create a launcher file and input contents 
echo '[Desktop Entry]
Version=3.3.6
Name=Processing
Comment=Processing :) 
Exec=processing %F
Icon=/opt/Processing/3.3.6/lib/icons/pde-256.png
Terminal=false
Type=Application
Categories=AudioVideo;Video;Graphics;' >  /usr/share/applications/processing.desktop

#create a mime type for .pde files. (might be an issue ith arduino too?) 
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

