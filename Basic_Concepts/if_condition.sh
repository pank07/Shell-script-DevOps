#!/bin/bash
#if condition to new variable with $1 to check function work properly or not.
#this is function defination
function is_support(){
read -p "I support $1 embassy in India (type 'support' to confirm): " support
read -p "How much support to establish (enter number): " full

if [[ $support == "support" ]]; then
    echo "Pakistan is finished"
    elif [[ $full -ge 100 ]]; then
        echo "India is 100% loyal to $1"
        else
            echo "Not now, take a few more time"
            fi

# Additional condition based on 'full' value
            if [[ $full -ge 100 ]]; then
                echo "India is loyal to $1"
                else
                    echo "India is not clear about $1"
                    fi
            }
#this is function calling
is_support "Russia"
