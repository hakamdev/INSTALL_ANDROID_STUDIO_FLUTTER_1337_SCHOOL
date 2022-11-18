# Set up Android Studio for Flutter Development
echo "Cleaning up old dirs and symlinks!";
rm -rf ~/.android ~/.gradle ~/.dartServer ~/Library/Android ~/Library/Flutter;
rm -rf ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches;
rm -rf ~/goinfre/flutter.zip ~/goinfre/cmdline-tools.zip ~/goinfre/Flutter ~/goinfre/CMDTOOLSTEMP;

echo "Creating new dirs and symlinks";
mkdir ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches ~/goinfre/Flutter ~/goinfre/CMDTOOLSTEMP;
ln -s ~/goinfre/Android ~/Library/Android;
ln -s ~/goinfre/.gradle ~/.gradle;
ln -s ~/goinfre/.android ~/.android;
ln -s ~/goinfre/.dartServer ~/.dartServer;

echo "Downloading Flutter SDK";
curl -L -o ~/goinfre/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.2-stable.zip;

echo "Extracting Flutter SDK";
cd ~/goinfre && unzip flutter.zip -d ~/goinfre/Flutter

echo "Downloading Android Cmdline Tools";
curl -L -o ~/goinfre/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-mac-9123335_latest.zip;

echo "Extracting Android Cmdline Tools";
cd ~/goinfre && unzip cmdline-tools.zip -d ~/goinfre/CMDTOOLSTEMP;
mkdir -p ~/Library/Android/sdk/cmdline-tools/latest;
mv ~/goinfre/CMDTOOLSTEMP/cmdline-tools/* ~/Library/Android/sdk/cmdline-tools/latest;

echo "Updating PATH in .zshrc"
echo >> ~/.zshrc
echo "export JAVA_HOME=\"/Applications/Android Studio.app/Contents/jre/Contents/Home\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:/Applications/Android Studio.app/Contents/jre/Contents/Home/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/goinfre/Flutter/flutter/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/platform-tools\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/cmdline-tools/latest/bin\"" >> ~/.zshrc
echo

source ~/.zshrc

echo "Accepting Android Licenses";
yes | sdkmanager --licenses >> /dev/null;

echo "Installing Android SDKs";
sdkmanager "build-tools;33.0.0" "emulator" "extras;android;m2repository" "platform-tools" "platforms;android-32" "platforms;android-33" "sources;android-32" "sources;android-33" "system-images;android-32;google_apis;x86_64";

open /Applications/Android\ Studio.app

if [ $? -eq "1" ]; then
    echo "Android Studio is not installed! Please install it from Managed Software Center that was opened for you!"
    open /Applications/Managed\ Software\ Center.app
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

echo "1️⃣ - Open Android Studio, go to Plugins tab on the left side, and Install Flutter Plugin."
echo "7️⃣ - Open a terminal and run the command:$COLOR flutter doctor" $NC
echo "🔴- The errors concerning XCode, you can install cocoapods using:$COLOR brew install cocoapods" $NC
echo "🔴- If you don't have brew installed already: install it in goinfre using:\n$COLOR    curl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh" $NC
echo "⛔️- The XCode error can only be solved with Updating XCode. You can't do that. So, just ignore it." $NC

echo "✅- Greeeeeat!" $NC
echo "🔵- Now, create a new project by Selecting $COLOR New Flutter Project $NC or $COLOR New Project $NC if you do Native Android" $NC
echo "🔵- If you are asked for flutter SDK Path, here it is $COLOR $HOME/goinfre/Flutter/flutter" $NC
echo "🔵- After the project is created, you may need to show it where SDK is, the first time, so go to $COLOR File > Project Structure > $NC and where it says $COLOR<No SDK>$NC, select latest Android API..." $NC
echo "🔵- If you want to create an emulator, go to $COLOR Tools > AVD Manager > $NC and create a new one. You can download an image from there too." $NC
echo "🔵- If you want to run the app on your phone, you need to enable USB Debugging on your phone, and connect it to your computer." $NC
echo "🛑- If you prefer VSCode. You need to install VSCode Flutter and Dart extensions and stuff..." $NC
