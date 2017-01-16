#!/bin/bash

if [[ $1 = '' || $2 = '' ]]; then
    echo 'Usage :'
    echo '     InstallProcessing.sh --version --os_bit'
    echo '     ex: ./InstallProcessing.sh 3.1.2 64'
    echo '     --version => Processing version.'
    echo '     --ob_bit => Os bit 64 or 32.'
else
    echo This script will install Processing-$1-linux$2 on Ubuntu 16.04.

    #create folder
    mkdir /opt/Processing

    #unzip the tarball
    tar -xvzf processing-$1-linux$2.tgz -C /opt/Processing

    #rename the folder
    mv /opt/Processing/processing-$1 /opt/Processing/$1

    #create a desktop icon for Processing
    ln -s /opt/Processing/$1/processing /usr/local/bin/processing

    #create a launcher file and input contents
    echo "[Desktop Entry]
    1=$1
    Name=Processing
    Comment=Processing :)
    Exec=/opt/Processing/$1/processing %F
    Icon=/opt/Processing/$1/lib/icons/pde-256.png
    Terminal=false
    Type=Application
    Categories=AudioVideo;Video;Graphics;" >  /usr/share/applications/processing.desktop

    #create a mime type for .pde files. (might be an issue ith arduino too?)
    echo '<?xml 1="1.0" encoding="UTF-8"?>
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
fi
