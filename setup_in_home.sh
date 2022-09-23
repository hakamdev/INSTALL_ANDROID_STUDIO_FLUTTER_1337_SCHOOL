echo "1 Creating missing directories!";

rm -rf $HOME/.gradle $HOME/.android $HOME/.dartServer

ln -s $HOME/goinfre/.gradle ~/.gradle
ln -s $HOME/goinfre/.android ~/.android
ln -s $HOME/goinfre/.dartServer ~/.dartServer

DARTSERVER=$(ls -la $HOME/goinfre/ | grep .dartServer);
ANDROID=$(ls -la $HOME/goinfre/ | grep .android);
GRADLE=$(ls -la $HOME/goinfre/ | grep .gradle);
FLUTTER=$(ls -la $HOME/goinfre/ | grep Flutter);

if [ "$DARTSERVER" = "" ]; then
    echo "-- .dartServer Dir missing!";
    mkdir $HOME/goinfre/.dartServer;
    echo "-- .dartServer Dir created!";
fi
if [ "$ANDROID" = "" ]; then
    echo "-- .android Dir missing!";
    mkdir $HOME/goinfre/.android;
    echo "-- .android Dir created!";
fi
if [ "$GRADLE" = "" ]; then
    echo "-- .gradle Dir missing!";
    mkdir $HOME/goinfre/.gradle;
    echo "-- .gradle Dir created!";
fi
if [ "$FLUTTER" = "" ]; then
    echo "-- Flutter Dir missing!";
    mkdir $HOME/goinfre/Flutter;
    echo "-- Flutter Dir created!";
    FLTR=$(ls -la ~/Downloads/flutter.zip)
    if [ "$FLTR" = "" ]; then
        echo "-- Flutter.zip missing!";
        echo "-- Downloading Flutter SDK";
        curl -L -o $HOME/Downloads/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.2-stable.zip;
    fi
    echo "-- Extracting Flutter SDK";
    cd $HOME/Downloads && unzip flutter.zip -d $HOME/goinfre/Flutter;
fi

#############################################################################

ZSH=$(cat $HOME/.zshrc | grep ANDROID_SDK_HOME);

if [ "$ZSH" = "" ]; then
    echo "2 Updating PATH in .zshrc";
    echo >> ~/.zshrc
    echo "export JAVA_HOME=\"/Applications/Android Studio.app/Contents/jre/Contents/Home\"" >> ~/.zshrc
    echo "export PATH=\"\$PATH:/Applications/Android Studio.app/Contents/jre/Contents/Home/bin\"" >> ~/.zshrc
    # echo "export ANDROID_SDK_HOME=\"\$HOME/Library/Android/sdk\"" >> ~/.zshrc
    echo "export PATH=\"\$PATH:\$HOME/goinfre/Flutter/flutter/bin\"" >> ~/.zshrc
    echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/platform-tools\"" >> ~/.zshrc
    # echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/tools/bin\"" >> ~/.zshrc
    echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/cmdline-tools/latest/bin\"" >> ~/.zshrc
    echo
fi

#############################################################################

open /Applications/Android\ Studio.app;

if [ $? -eq "1" ]; then
    echo "Android Studio is not installed! Please install it from Managed Software Center!";
    open /Applications/Managed\ Software\ Center.app;
fi

COLOR='\033[0;32m'
COLOR2='\033[0;31m'
COLOR3='\033[0;33m'
NC='\033[0m'
clear
echo "$COLOR2 		⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️" $NC
echo "$COLOR2 		⛔️                                                ⛔️" $NC
echo "$COLOR2 		⛔️            GOOD. NOW THE MANUAL WORK           ⛔️" $NC
echo "$COLOR2 		⛔️            FOLLOW THESE INSTRUCTIONS           ⛔️" $NC
echo "$COLOR2 		⛔️             ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️            ⛔️" $NC
echo "$COLOR2 		⛔️                                                ⛔️" $NC
echo "$COLOR2 		⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️" $NC
echo "0️⃣ -$COLOR3 OPEN A NEW TERMINAL WINDOW TO KEEP THESE INSTRUCTIONS VISIBLE" $NC
echo "0️⃣ -$COLOR3 IF YOU ACCIDENTALLY CLOSE THIS WINDOW RUN:$COLOR curl -fsSL https://raw.githubusercontent.com/hakamdev/INSTALL_ANDROID_STUDIO_FLUTTER_1337_SCHOOL/master/show_instr.sh | zsh" $NC
echo "1️⃣ - Open Android Studio if it wasn't opened automatically and follow the instructions to install SDK!"
echo "2️⃣ - Now that the SDK is installed, go to Plugins tab on the left side, and Install Flutter Plugin."
echo "3️⃣ - Now, click on the 3 dots, on the top-right corner of Android St. and choose SDK Manager"
echo "4️⃣ - On the SDK manager, navigate to the SDK Tools in the middle, and check Android SDK Command-line Tools"
echo "5️⃣ - If you need an emulator you can download an Image later when you want to create a new emulator, by selecting AVD manager"
echo "6️⃣ - Now, Click OK to start installing the extra stuff you checked."
echo "7️⃣ - Finally, open a terminal and run the command:$COLOR flutter doctor" $NC
echo "🔴- You'll see some error, don't worry, just need to accept to licenses, run:$COLOR flutter doctor --android-licenses" $NC
echo "   and accept all licenses, by writing $COLOR'y'$NC and hitting Enter each time." $NC
echo "🔴- The errors concerning XCode, you can install cocoapods using:$COLOR brew install cocoapods" $NC
echo "🔴- If you don't have brew installed already: install it in goinfre using:\n$COLOR    curl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh" $NC
echo "⛔️- The XCode error can only be solved with Updating XCode. You can't do that. So, just ignore it." $NC

echo "✅- Greeeeeat!" $NC
echo "🔵- Now, create a new project by Selecting $COLOR New Flutter Project $NC or $COLOR New Project $NC if you do Native Android" $NC
echo "🔵- If you are asked for flutter SDK Path, here it is $COLOR $HOME/goinfre/Flutter/flutter" $NC
echo "🔵- After the project is created, you may need to show it where SDK is, the first time, so go to $COLOR File > Project Structure > $NC and where it says $COLOR<No SDK>$NC, select Android API 31..." $NC
echo "🔵- If you want to create an emulator, go to $COLOR Tools > AVD Manager > $NC and create a new one. You can download an image from there too." $NC
echo "🔵- If you want to run the app on your phone, you need to enable USB Debugging on your phone, and connect it to your computer." $NC
echo "🛑- If you prefer VSCode. Then I can't help you. Figure it out yourself. You probably need to install Flutter and Dart extensions and stuff..." $NC