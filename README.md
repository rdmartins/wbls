# Windows Blurred Login Screen

This little script will take an screenshot of your current screen and set it as login screen background, just before locking your session.

Keep in mind that you need to bypass the lock screen for it to be real nice.

> Put a screenshot here (just need to figure how)

## How it works

With the executable running in background, press Win+W.
The following will then happen:

1. A screenshot will be taken and saved on the Windows temp directory;
1. This screenshot will be set as your login/lock screen;
1. Your computer will lock;
1. Your background will be set as your login/lock screen.

Some considerations:

* The screenshot will not be blurred, we are relying to the Windows lock screen to do that;
* You need to bypass the lock screen, or your screenshot will be visible to anyone.

## Installation

I recommend you download the last compiled executable from the [relases](https://github.com/rdmartins/lock/releases) tab.

Then, simply run it as administrator.

## Autorun on login without UAC

The only way I found to run the app on login without having to press Yes everytime on the UAC screen is using a schedule.

You can scredule the app to run with administrator privileges on login, and this way the UAC screen will not show up.

## Bypassing the lock screen

First, execute gpedit.msc.

Then, on the left panel, navigate to Computer Configuration -> Administrative Models -> Control Panel -> Customization.

![gpedit](https://user-images.githubusercontent.com/13852370/74116299-bfe4b780-4b91-11ea-99cc-cc77ccf5a5de.png)

Double click the "Do not show lock screen" configuration, and set it to "Enbaled".

![Configuration](https://user-images.githubusercontent.com/13852370/74116305-c3783e80-4b91-11ea-97b0-99599de76dd5.png)

Click OK and close the last window.

Enjoy ;)

---
<a href="https://www.buymeacoffee.com/rdmartins" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>
