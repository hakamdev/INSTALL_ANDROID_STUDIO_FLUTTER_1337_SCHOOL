Color_Off='\033[0m'       # Text Reset
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

echo -e "⚒ ${BGreen}Creating missing directories!${Color_Off}\n";

rm -rf $HOME/.gradle $HOME/.android $HOME/.dartServer

ln -s $HOME/goinfre/.gradle ~/.gradle
ln -s $HOME/goinfre/.android ~/.android
ln -s $HOME/goinfre/.dartServer ~/.dartServer

DARTSERVER=$(ls -la $HOME/goinfre/ | grep .dartServer);
ANDROID=$(ls -la $HOME/goinfre/ | grep .android);
GRADLE=$(ls -la $HOME/goinfre/ | grep .gradle);
FLUTTER=$(ls -la $HOME/goinfre/ | grep Flutter);

if [ "$DARTSERVER" = "" ]; then
    echo -e "❌ .dartServer Dir ${BRed}missing!${Color_Off}";
    mkdir $HOME/goinfre/.dartServer;
    echo -e  "✅ .dartServer Dir ${BGreen}created!${Color_Off}\n";
fi
if [ "$ANDROID" = "" ]; then
    echo -e "❌ .android Dir ${BRed}missing!${Color_Off}";
    mkdir $HOME/goinfre/.android;
    echo -e "✅ .android Dir ${BGreen}created!${Color_Off}\n";
fi
if [ "$GRADLE" = "" ]; then
    echo -e "❌ .gradle Dir ${BRed}missing!${Color_Off}";
    mkdir $HOME/goinfre/.gradle;
    echo -e "✅ .gradle Dir ${BGreen}created!${Color_Off}\n";
fi
if [ "$FLUTTER" = "" ]; then
    echo -e "❌ Flutter Dir ${BRed}missing!${Color_Off}";
    mkdir $HOME/goinfre/Flutter;
    echo -e "✅ Flutter Dir ${BGreen}created!${Color_Off}\n";
    FLTR=$(ls -la ~/Downloads/flutter.zip)
    if [ "$FLTR" = "" ]; then
        echo -e "${BYellow}Note:${Color_Off} ❌ Flutter.zip ${BGreen}missing!${Color_Off}";
        echo -e "${BYellow}Note:${Color_Off} 🚀 ${BGreen}Downloading Flutter SDK${Color_Off}\n";
        curl -L -o $HOME/Downloads/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.2-stable.zip;
    fi
    echo "⚒ ${BGreen}Extracting Flutter SDK${Color_Off}\n";
    cd $HOME/Downloads && unzip flutter.zip -d $HOME/goinfre/Flutter;
fi

#############################################################################

ZSH=$(cat $HOME/.zshrc | grep ANDROID_SDK_HOME);

if [ "$ZSH" = "" ]; then
    echo "2 Updating PATH in .zshrc";
    echo >> $HOME/.zshrc;
    echo "export JAVA_HOME=\"/Applications/Android Studio.app/Contents/jre/Contents/Home\"" >> $HOME/.zshrc;
    echo "export ANDROID_SDK_HOME=\"\$HOME/Library/Android/sdk\"" >> $HOME/.zshrc;
    echo "export PATH=\"\$PATH:\$HOME/goinfre/Flutter/flutter/bin\"" >> $HOME/.zshrc;
    echo "export PATH=\"\$PATH:/Applications/Android Studio.app/Contents/jre/Contents/Home/bin\"" >> $HOME/.zshrc;
    echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/platform-tools\"" >> $HOME/.zshrc;
    echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/tools/bin\"" >> $HOME/.zshrc;
fi

#############################################################################

open /Applications/Android\ Studio.app;

if [ $? -eq "1" ]; then
    echo "${BYellow}Note:${Color_Off} 🤖 ${BCyan}Android Studio${Color_Off} is ${BRed}not installed!${Color_Off}, Please ${BBlue}install${Color_Off} it from Managed Software Center that was ${BBlue}opened for you!${Color_Off}\n"
    open /Applications/Managed\ Software\ Center.app
fi

# echo "Good, now to the manual stuff :("
# echo
# #############################################################################
# echo "1- Open Android Studio if it wasn't opened automatically and follow the instructions to install SDK!"
# echo "2- Now that the SDK is installed, go to Plugins tab on the left side, and Install Flutter Plugin."
# echo "3- Now, click on the 3 dots, on the top-right corner of Android St. and choose SDK Manager"
# echo "4- On the SDK manager, navigate to the SDK Tools in the middle, and check Android SDK Command-line Tools"
# echo "5-2 If you need an emulator you can download an Image later when you want to create a new emulator, by selecting AVD manager"
# echo "5-3 Now, Click OK to start installing the extra stuff you checked."
# echo "Finally, open a terminal and run the command: flutter doctor"
# echo "You'll see some error, don't worry, just need to accept to licenses, run: flutter doctor --android-licenses"
# echo "and accept all licenses, by writing Y and hitting Enter each time."
# echo "The errors concerning XCode, you can install cocoapods using: brew install cocoapods"
# echo "If you don't have brew installed already: install it in goinfre using:\ncurl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh"
# echo "The other XCode error can only be solved with Updating XCode, which requires Admin Previliges :("

# echo "Gongrats!"
# echo "Now, create a new project by Selecting New Flutter Project or New Project if you do Native Android"
# echo "if you are asked for flutter SDK Path, here it is $HOME/goinfre/Flutter/flutter"
# echo "After the project is created, you may need to show it where SDK is, the first time, so go to File > Project Structure > and where it says <No SDK>, select Android API 31..."