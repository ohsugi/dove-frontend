# Dove-Frontend

<img src="./assets/images/logo.png" width="50%">

## Architecture

- **Frontend**: Flutter/Dart: https://github.com/ohsugi/dove-frontend
- **Backend**: Rust/Anchor: https://github.com/ohsugi/dove
- **Blockchain**: Solana
- **Deployment**: Github/Github Pages

---

## Development

### Environment

1. Follow the below setup guide according to your platform. It would be the perfect guidance.
   - **Entire Guidance**: https://codelabs.developers.google.com/codelabs/flutter-codelab-first#1
   - **Set up an editor**: https://docs.flutter.dev/get-started/editor
   - **Code formatting**: https://docs.flutter.dev/tools/formatting#automatically-formatting-code-in-vs-code
1. There would be related tools needed to work Flutter/Dart/Android Studio correctly ans asked to install in the above guidances.
   - **Visual Studio Code**: https://code.visualstudio.com/download
   - **Flutter SDK**: https://docs.flutter.dev/get-started/install
     - Recommend to install flutter nearby root directly like `C:\src\flutter`.
   - **Android Studio**: https://docs.flutter.dev/get-started/install/windows#get-the-flutter-sdk
   - **Visual Studio**: https://docs.flutter.dev/get-started/install/windows#android-setup
   - **JDK**: https://www.oracle.com/java/technologies/downloads/
1. One of the key tool would be `flutter doctor` available in the flutter root folder to detect any issues to work flutter and Android Studio correctly and show the guidance to fix the problems.<br>
   <img src="./images/flutter_doctor.png" width="48%">
1. Some potencial issues and solutions previously faced were listed for future same problems:
   - Commadline tools: if Android Stduio installer does not install commandline tools, you can find download links in the section named "Command line tools only" the below of the android studio downlods on [this page](https://developer.android.com/studio).
   - You can then boot `sdkmanager.bat` in the commandline-tools/bin folder in it with the argument like `sdkmanager --install "commandline-tools;latest" --sdk_path=<path_to_sdk>.
   - VM Acceleration: https://developer.android.com/studio/run/emulator-acceleration#accel-vm
   - You also have to agree the Android Licenses via flutter doctor by `flutter doctor --android-licenses`
1. There would be related environment variables and those examples in my environment.
   - **ANDROID_HOME**: C:/Users/\<user_name>/AppData/Local/Android/Sdk
   - **ANDROID_USER_HOME**: C:/Users/\<user_name>/.android
   - **PATH**
     - **VS Code Bin**: C:/Users/\<user_name>/AppData/Local/Programs/Microsoft VS Code/bin
     - **JAVA Home**: C:/Program Files/Common Files/Oracle/Java/javapath
1. It would be a great way to catch up on the basics by coding a simple app with the following tutorial.
   - https://docs.flutter.dev/get-started/codelab

### Dependencies

1. Right click on `pubspec.yaml` and select `Get Packages` or type `flutter pub get` on your terminal to install dependencies.
   - If you will get some issues, once you can clean up the dependencies from the cache by typing `flutter clean` and reinstall the dependencies might clear those issues sometime.

### Build Configuration with dotenv

1. Create `.env` file in the root folder and copy the below content to it.
   ```
   http_cluster=localnet
   app_uri=https://my_dapp.com
   app_icon_uri=favicon.png
   app_name=Dove
   ```

### Dart Fix

1. You can use dart fix to fix some issues automatically by typing the below command on the terminal. Details are explained on (this page)[https://dart.dev/tools/dart-fix].
   > dart fix --dry-run
   > dart fix --apply

### Debug

1. You can use DevTools by opening Command Pallete by selecting [View]->[Command Palette] or `Ctrl + Shift + P` and type `> Flutter: Open DevTools` and then select for instance `Open Widget Inspector Page` to open Widget Inspector.

# Credit

The first code base was created based on the below template. The code was then modified to fit the needs of the project.

- https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI

The Dove Frontend is using the below images/icons on the app.

- By Boris Chilingaryan - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=120461277
- By Creative Tail - https://www.creativetail.com/40-free-flat-animal-icons/https://archive.is/lE5aD, CC BY 4.0, https://commons.wikimedia.org/w/index.php?curid=47524126
- By Searchprivacyexpert - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=65221873
- By VateGV - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=63793145
