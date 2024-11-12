while ($true) {
    $addr = "1.1.1.15"
    $url = "http://$addr/login.html"

    $headers = @{
        "Pragma"                 = "no-cache"
        "Cache-Control"          = "no-cache"
        "DNT"                    = "1"
        "Upgrade-Insecure-Requests" = "1"
        "User-Agent"             = "Mozilla/5.0 (X11; CrOS x86_64 14150.7.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.12 Safari/537.36"
        "Origin"                 = "http://$addr/"
        "Content-Type"           = "application/x-www-form-urlencoded"
        "Accept"                 = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        "Referer"                = "http://$addr/"
        "Accept-Language"        = "en-US,en;q=0.9,es;q=0.8,fr;q=0.7"
    }

    $body = "buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=FCPSOnboard"

    try {
        $response = Invoke-WebRequest -Uri $url -Method POST -Headers $headers -Body $body -ErrorAction Stop
        Write-Host "Authentication successful. Response status code: $($response.StatusCode)"
    }
    catch {
        Write-Host "Error occurred during authentication: $($_.Exception.Message)"
    }
    # Adjust time here
    Start-Sleep -Seconds 5
}
