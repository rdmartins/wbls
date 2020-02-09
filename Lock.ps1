#Requires -RunAsAdministrator
[Reflection.Assembly]::LoadWithPartialName("System.Drawing")

function takeScreenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

function setLockScreenWallpaper($path) {
    $REGKEYPATH = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

    if(!(Test-Path $RegKeyPath)) {
        New-Item -Path $RegKeyPath -Force | Out-Null
    }

    New-ItemProperty -Path $REGKEYPATH -Name "LockScreenImageStatus" -Value "1" -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $REGKEYPATH -Name "LockScreenImagePath" -Value $path -PropertyType STRING -Force | Out-Null
    New-ItemProperty -Path $REGKEYPATH -Name "LockScreenImageUrl" -Value $path -PropertyType STRING -Force | Out-Null
}

$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, 1920, 1080)

$path = "C:\Windows\Temp\lock.png"
takeScreenshot $bounds $path
setLockScreenWallpaper $path

Invoke-Command {rundll32.exe user32.dll,LockWorkStation}

Start-Sleep -s 1
$path = [System.Environment]::ExpandEnvironmentVariables("%AppData%\Microsoft\Windows\Themes\TranscodedWallpaper")
setLockScreenWallpaper $path
