# FBLA: Manage

### Authors & Contact Information:

> Leo Zhang, lzhang.0693@gmail.com / 786-702-1027

> Gianni Tipan, gtipan14@gmail.com / 786-651-7072

> Luis Villanuea, luisvl2002@gmail.com / 786-768-5348

### General Information:
FBLA: Manage, is a app that is compatible with iOS and Android. This app was developed for the purpose of allowing local chapters to manage their chapters. It includes screens for regular users and for admins (advisors/officers of their respective FBLA chapters). Regular users just have access to information and sign-up forms. Admins have access to more screens like meeting attendence and the ability to add events in the app. Admins are just superior users.

Frontend and the UI were built using flutter

Backend is a firebase database.

### Requirements:
- **UNRESTRICTED INTERNET CONNECTION.**
- Android phone running at least Android 5.0 (Lolipop), prefered Android 10 (API 29) or Mac or Windows Computer.

### Quick Start:
Since this app isn't in the play store, you must go into your phone settings go into security, and turn on unknown sources and then download the pre-compiled apk onto your android phone.
The android apk is in the folder named APK HERE. The recommended way of transfering the apk onto your android device is to upload the apk onto a file hosting website or upload to google drive and turn on link sharing copy & paste the link into the broswer of the selected phone and download and open the apk from there. Another method is to connect your android device to a computer and transfer it through the computer by copy and pasting the apk into the phone.
When you open the apk, you will recieve this message:
![](./readme_images/1-insBLOCK.jpg)

Just click settings and it will redirect you here:
![](./readme_images/2-unknownSOURCES.jpg)

Then click allow unknown sources then go back to the installation page and click install:
![](./readme_images/3-install.jpg)

The app is successfully installed! Now click open.
![](./readme_images/4-installed.jpg)

If this doesn't work, then go to Regular Start.

### Using The App:
Students don’t need login information to access the information necessary for them to see.

Admin login credentials or create your own - 

Username: johndoe@example.com

Password: johndoe123

### Regular Start:
In-case the quick start didn't work. The you would have to manually compile and install it.
- #### Android
Go here: https://flutter.dev/docs/get-started/install and follow the instructions for the device that you have.

When you get to heading **test drive**, stop. Linked here: https://flutter.dev/docs/get-started/test-drive?tab=terminal

Now all you have to do is copy the folder that says SOURCE_CODE_HERE onto your Desktop or anywhere you want. Once you do that, if your on Windows then open the folder that you copied onto your location of choice and open a terminal there. When you do run `flutter devices` to see if there is any open emulators of android if not then open the emulator through Android Studio. Once you are done with this then all you have to do it `flutter run` and wait, then the app will open.

- #### iOS
Follow this tutorial: https://flutter.dev/docs/get-started/install/macos

When you get to https://flutter.dev/docs/get-started/install/macos#create-and-run-a-simple-flutter-app instead of creating a new app, just copy and paste ours then `cd` into the directory and run `flutter run` then contiune on the tutorial if you want to actually deploy on an iOS device.
