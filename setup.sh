echo "0- Making sure Android studio is installed...";
STUDIO_EXISTS=$(ls -la /Applications | grep Android\ Studio)
if [ "$STUDIO_EXISTS" = "" ]; then
    echo "-- Android Studio is not installed! Please install it from Managed Software Center and rerun this script!";
    open /Applications/Managed\ Software\ Center.app;
    exit 1;
fi

echo "1- Removing old dirs and symlinks...";
rm -rf $HOME/.android $HOME/.gradle $HOME/.dartServer $HOME/Library/Android $HOME/Library/Flutter;
rm -rf $HOME/goinfre/Android $HOME/goinfre/.android $HOME/goinfre/.gradle $HOME/goinfre/.dartServer $HOME/goinfre/Caches;
rm -rf $HOME/goinfre/flutter.zip $HOME/goinfre/cmdline-tools.zip $HOME/goinfre/Flutter $HOME/goinfre/CMDTOOLSTEMP;
echo "-- Done"

echo "2- Creating new dirs...";
mkdir $HOME/goinfre/Android $HOME/goinfre/.android $HOME/goinfre/.gradle $HOME/goinfre/.dartServer $HOME/goinfre/Caches $HOME/goinfre/Flutter $HOME/goinfre/CMDTOOLSTEMP;
echo "-- Done"

echo "3- Creating symlinks..."
ln -s $HOME/goinfre/.gradle $HOME/.gradle
ln -s $HOME/goinfre/.android $HOME/.android
ln -s $HOME/goinfre/.dartServer $HOME/.dartServer
ln -s $HOME/goinfre/Android $HOME/Library/Android
ln -s $HOME/goinfre/Flutter $HOME/Library/Flutter
echo "-- Done"

echo "4- Downloading and installing flutter SDK...";
FLTR=$(ls -la $HOME/Downloads | grep flutter.zip)
if [ "$FLTR" = "" ]; then
    echo "-- Flutter.zip missing!";
    echo "-- Downloading Flutter SDK... Please wait...";
    curl -L -o $HOME/Downloads/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.16.8-stable.zip;
fi

echo "-- Extracting Flutter SDK... Please wait...";
unzip $HOME/Downloads/flutter.zip -d $HOME/goinfre/Flutter > /dev/null;
echo "-- Done";

echo "5- Downloading Android Cmdline Tools... Please wait...";
curl -L -o $HOME/goinfre/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-mac-9123335_latest.zip;
echo "6- Extracting Android Cmdline Tools... Please wait...";
unzip $HOME/goinfre/cmdline-tools.zip -d $HOME/goinfre/CMDTOOLSTEMP > /dev/null;
mkdir -p $HOME/Library/Android/sdk/cmdline-tools/latest;
mv $HOME/goinfre/CMDTOOLSTEMP/cmdline-tools/* $HOME/Library/Android/sdk/cmdline-tools/latest;
echo "-- Done";

echo "7- Updating PATH in .zshrc";
ZSH=$(cat $HOME/.zshrc | grep JAVA_HOME);

if [ "$ZSH" = "" ]; then
    echo "2 Updating PATH in .zshrc";
    echo >> $HOME/.zshrc
    echo 'export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"' >> $HOME/.zshrc
    echo 'export PATH="/Applications/Android Studio.app/Contents/jre/Contents/Home/bin:$PATH"' >> $HOME/.zshrc
    echo 'export PATH="$HOME/goinfre/Flutter/flutter/bin:$PATH"' >> $HOME/.zshrc
    echo 'export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"' >> $HOME/.zshrc
    echo 'export PATH="$HOME/Library/Android/sdk/cmdline-tools/latest/bin:$PATH"' >> $HOME/.zshrc
    echo
fi

source $HOME/.zshrc
echo "-- Done"

echo "Accepting Android Licenses... (This is done automatically on your behalf)";
yes | sdkmanager --licenses > /dev/null;
echo "-- Done"

echo "Installing Android SDK...Please wait...";
sdkmanager "build-tools;34.0.0" \
    "extras;android;m2repository" \
    "platform-tools" \
    "platforms;android-33" \
    "platforms;android-34" \
    "skiaparser;3" \
    "sources;android-33" \
    "sources;android-34" \
    "system-images;android-34;google_apis;x86_64"
echo "-- Done"

echo "Installing A compatible Android emulator (cuz the latest version doesn't work)...Please wait...";
curl 'https://r4---sn-5hne6nzd.gvt1.com/edgedl/android/repository/emulator-darwin_x64-7820599.zip?mh=Y7&pl=20&shardbypass=sd&cm2rm=sn-hxqpuxa-jhoz7l,sn-h5q6l7l&req_id=2102259e3624a0d7&ipbypass=yes&redirect_counter=2&cms_redirect=yes&cmsv=e&mip=197.230.240.146&mm=34&mn=sn-5hne6nzd&ms=ltu&mt=1706119249&mv=m&mvi=4&rmhost=r3---sn-5hne6nzd.gvt1.com' > $HOME/Library/Android/sdk/emulator.zip;
unzip $HOME/Library/Android/sdk/emulator.zip -d $HOME/Library/Android/sdk > /dev/null;

curl -fsSL https://raw.githubusercontent.com/hakamdev/INSTALL_ANDROID_STUDIO_FLUTTER_1337_SCHOOL/master/package.xml > $HOME/Library/Android/sdk/emulator/package.xml;
echo "-- Done";

echo "Opening Android Studio...";
open /Applications/Android\ Studio.app

COLOR='\033[0;32m'
COLOR2='\033[0;31m'
COLOR3='\033[0;33m'
NC='\033[0m'

echo "$COLOR2 	⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️" $NC
echo "$COLOR2 	⛔️                                                ⛔️" $NC
echo "$COLOR2 	⛔️            GOOD. NOW THE MANUAL WORK           ⛔️" $NC
echo "$COLOR2 	⛔️            FOLLOW THESE INSTRUCTIONS           ⛔️" $NC
echo "$COLOR2 	⛔️             ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️ ⬇️            ⛔️" $NC
echo "$COLOR2 	⛔️                                                ⛔️" $NC
echo "$COLOR2 	⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️" $NC

echo "If Android Studio is not opened automatically, please open it manually."
echo "Then, follow the steps to setup Android Studio. (Just smach the next/finish buttons)"
echo "Finally, install the Flutter and Dart plugins. (Navigate to the plugins tab)"
echo "If you want to use VSCode, install the Flutter and Dart extensions there too."
echo "If you want to install any other SDKs, please do so from Android Studio, or using sdkmanager command (Google it)"
echo "Done :). Happy hacking!"
