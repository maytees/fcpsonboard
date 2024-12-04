#!/bin/bash

# Define the target address
addr="1.1.1.15"

# Infinite loop to continuously attempt authentication
while true; do
    echo "Attempting authentication request..."
    
    # Construct and execute the curl request
    response=$(curl "http://${addr}/login.html" \
        -X POST \
        -H 'Connection: keep-alive' \
        -H 'Pragma: no-cache' \
        -H 'Cache-Control: no-cache' \
        -H 'DNT: 1' \
        -H 'Upgrade-Insecure-Requests: 1' \
        -H 'User-Agent: Mozilla/5.0 (X11; CrOS x86_64 14150.7.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.12 Safari/537.36' \
        -H "Origin: http://${addr}/" \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
        -H "Referer: http://${addr}/" \
        -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8,fr;q=0.7' \
        --data-raw 'buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network' \
        --compressed \
        --insecure \
        -s \
        -w "%{http_code}" \
        -o /dev/null)

    # Check the HTTP response code
    if [ "$response" -eq 200 ]; then
        echo "Authentication successful. Response status code: $response"
    else
        echo "Error occurred during authentication. Response status code: $response"
    fi

    # Wait for 5 seconds before the next attempt
    echo "Waiting 5 seconds before next attempt..."
    sleep 5
done
