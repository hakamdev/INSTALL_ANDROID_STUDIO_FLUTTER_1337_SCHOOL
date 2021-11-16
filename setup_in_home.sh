echo "1 Creating missing directories!";

rm -rf $HOME/.gradle $HOME/.android $HOME/.dartServer

ln -s $HOME/goinfre/.gradle ~/gradle
ln -s $HOME/goinfre/.android ~/android
ln -s $HOME/goinfre/.dartServer ~/dartServer

DARTSERVER=$(ls $HOME/goinfre | grep .dartServer);
ANDROID=$(ls $HOME/goinfre | grep .android);
GRADLE=$(ls $HOME/goinfre | grep .gradle);
FLUTTER=$(ls $HOME/goinfre | grep Flutter);

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
    FLTR=$(ls ~/Downloads/flutter.zip)
    if [ "$FLTR" = "" ]; then
        echo "-- Flutter.zip missing!";
        echo "-- Downloading Flutter SDK";
        curl -L -o $HOME/Downloads/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_2.5.3-stable.zip;
    fi
    echo "-- Extracting Flutter SDK";
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
    echo "Android Studio is not installed! Please install it from Managed Software Center!";
    open /Applications/Managed\ Software\ Center.app;
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