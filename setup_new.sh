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

# Set up Android Studio for Flutter Development
echo -e "✈  ${BGreen}Cleaning up old dirs and symlinks!${Color_Off}\n";
rm -rf ~/.android ~/.gradle ~/.dartServer ~/Library/Android ~/Library/Flutter;
rm -rf ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches ~/goinfre/Flutter;

echo -e "🚩 ${BGreen}Creating new dirs and symlinks${Color_Off}\n";
mkdir ~/goinfre/Android ~/goinfre/.android ~/goinfre/.gradle ~/goinfre/.dartServer ~/goinfre/Caches ~/goinfre/Flutter;
ln -s ~/goinfre/Android ~/Library/Android;
ln -s ~/goinfre/.gradle ~/.gradle;
ln -s ~/goinfre/.android ~/.android;
ln -s ~/goinfre/.dartServer ~/.dartServer;

echo -e "🚀 ${BGreen}Downloading Flutter SDK${Color_Off}\n";
curl -L -o ~/goinfre/flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.2-stable.zip;

echo -e "⚒ ${BGreen}Extracting Flutter SDK${Color_Off}\n";
cd ~/goinfre && unzip flutter.zip -d ~/goinfre/Flutter


echo >> ~/.zshrc
echo "export JAVA_HOME=\"/Applications/Android Studio.app/Contents/jre/Contents/Home\"" >> ~/.zshrc
echo "export ANDROID_SDK_HOME=\"\$HOME/Library/Android/sdk\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/goinfre/Flutter/flutter/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:/Applications/Android Studio.app/Contents/jre/Contents/Home/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/platform-tools\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:\$HOME/Library/Android/sdk/tools/bin\"" >> ~/.zshrc
echo

echo "✅ PATH in .zshrc ${BGreen}Updated${Color_Off}\n"
open /Applications/Android\ Studio.app

if [ $? -eq "1" ]; then
    echo "${BYellow}Note:${Color_Off} 🤖 ${BCyan}Android Studio${Color_Off} is ${BRed}not installed!${Color_Off}, Please ${BBlue}install${Color_Off} it from Managed Software Center that was ${BBlue}opened for you!${Color_Off}\n"
    open /Applications/Managed\ Software\ Center.app
fi

echo "✅ ${BGreen}Good, Now to the manual stuff :(${Color_Off}"

echo -e "   ${BGreen}①${Color_Off}  Open Android Studio if it wasn't opened automatically and follow the instructions to install SDK!"
echo -e "   ${BGreen}②${Color_Off}  Now that the SDK is installed, go to Plugins tab on the left side, and Install Flutter Plugin."
echo -e "   ${BGreen}③${Color_Off}  Now, click on the 3 dots, on the top-right corner of Android St. and choose SDK Manager"
echo -e "   ${BGreen}④${Color_Off}  On the SDK manager, navigate to the SDK Tools in the middle, and check Android SDK Command-line Tools"
echo -e "   ${BGreen}⑤${Color_Off}  If you need an emulator you can download an Image later when you want to create a new emulator, by selecting AVD manager,\n     Then Click OK to start installing the extra stuff you checked.\n"

echo -e "🎉 ${BGreen}Finally${Color_Off}, open a terminal and ${BBlue}run${Color_Off} the command: ${BBlue}flutter doctor${Color_Off}\n"
echo -e "${BYellow}Note:${Color_Off} You'll see some ${BRed}error${Color_Off}, don't worry, just need to ${BBlue}accept${Color_Off} licenses, run: ${BBlue}flutter doctor --android-licenses${Color_Off}"
echo -e "and accept all licenses, by writing ${BBlue}Y${Color_Off} and hitting Enter each time.\n"
echo -e "The ${BRed}errors concerning XCode${Color_Off}, you can install cocoapods using: ${BBlue}brew install cocoapods${Color_Off}"
echo -e "${BYellow}Note:${Color_Off} If you ${BRed}don't have brew installed${Color_Off}, install it in goinfre by:\n${BBlue}curl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh${Color_Off}\n"
echo -e "${BYellow}Note:${Color_Off} The other XCode ${BRed}error${Color_Off} can only be solved with Updating XCode, which requires Admin Previliges :(\n"

echo -e "🎉 ${BGreen}Gongrats Flutter is Ready to use!${Color_Off}\n"
echo -e "Now,${BBlue}You can create a new project${Color_Off} by Selecting ${BBlue}New Flutter${Color_Off} Project or ${BBlue}New Project${Color_Off} if you do Native Android\n"
echo -e "${BYellow}Note:${Color_Off} if you are asked for ${BRed}flutter SDK Path${Color_Off}, here it is ${BBlue}$HOME/goinfre/Flutter/flutter${Color_Off}"
echo -e "${BYellow}Note:${Color_Off} After the project is created, you ${BBlue}may need${Color_Off} to show it where SDK is, the ${BBlue}first time${Color_Off}, so go to ${BBlue}File > Project Structure > and where it says <No SDK>, select Android API 31...${Color_Off}"
