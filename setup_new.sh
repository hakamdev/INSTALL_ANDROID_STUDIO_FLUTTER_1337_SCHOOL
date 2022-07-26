# Set up Android Studio for Flutter Development
echo "Cleaning up old dirs and symlinks!";
rm -rf ~/.android ~/.gradle ~/.dartServer ~/Library/Android ~/Library/Flutter;
rm -rf ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches ~/goinfre/Flutter;

echo "Creating new dirs and symlinks";
mkdir ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches ~/goinfre/Flutter;
ln -s ~/goinfre/Android ~/Library/Android;
ln -s ~/goinfre/.gradle ~/.gradle;
ln -s ~/goinfre/.android ~/.android;
ln -s ~/goinfre/.dartServer ~/.dartServer;

echo "Downloading Flutter SDK";
curl -L -o ~/goinfre/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.2-stable.zip;

echo "Extracting Flutter SDK";
cd ~/goinfre && unzip flutter.zip -d ~/goinfre/Flutter


echo >> ~/.zshrc
echo "export JAVA_HOME=\"/Applications/Android Studio.app/Contents/jre/Contents/Home\"" >> ~/.zshrc
echo "export ANDROID_SDK_HOME=\"\$HOME/Library/Android/sdk\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/goinfre/Flutter/flutter/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:/Applications/Android Studio.app/Contents/jre/Contents/Home/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/platform-tools\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/tools/bin\"" >> ~/.zshrc
echo

echo "Updating PATH in .zshrc"
open /Applications/Android\ Studio.app

if [ $? -eq "1" ]; then
    echo "Android Studio is not installed! Please install it from Managed Software Center that was opened for you!"
    open /Applications/Managed\ Software\ Center.app
fi

echo "Good, now to the manual stuff :("

# echo "1- I opened goinre for you! now double click the Android-Studio.dmg and Drag the App and it shows up to goinfre folder!"
echo "1- Open Android Studio if it wasn't opened automatically and follow the instructions to install SDK!"
echo "2- Now that the SDK is installed, go to Plugins tab on the left side, and Install Flutter Plugin."
echo "3- Now, click on the 3 dots, on the top-right corner of Android St. and choose SDK Manager"
echo "4- On the SDK manager, navigate to the SDK Tools in the middle, and check Android SDK Command-line Tools"
echo "5-2 If you need an emulator you can download an Image later when you want to create a new emulator, by selecting AVD manager"
echo "5-3 Now, Click OK to start installing the extra stuff you checked."
echo "Finally, open a terminal and run the command: flutter doctor"
echo "You'll see some error, don't worry, just need to accept to licenses, run: flutter doctor --android-licenses"
echo "and accept all licenses, by writing Y and hitting Enter each time."
echo "The errors concerning XCode, you can install cocoapods using: brew install cocoapods"
echo "If you don't have brew installed already: install it in goinfre using:\ncurl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh"
echo "The other XCode error can only be solved with Updating XCode, which requires Admin Previliges :("

echo "Gongrats!"
echo "Now, create a new project by Selecting New Flutter Project or New Project if you do Native Android"
echo "if you are asked for flutter SDK Path, here it is $HOME/goinfre/Flutter/flutter"
echo "After the project is created, you may need to show it where SDK is, the first time, so go to File > Project Structure > and where it says <No SDK>, select Android API 31..."