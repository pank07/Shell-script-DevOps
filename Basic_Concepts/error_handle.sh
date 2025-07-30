#!/bin/bash

create_directory(){
mkdir "Demo_Folder"
}

if ! create_directory; then
        echo "folder is already exists, (code run successfully)"
        exit 1
fi
echo "your folder is created"
