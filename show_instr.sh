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
echo "🔵- After the project is created, you may need to show it where SDK is, the first time, so go to $COLOR File > Project Structure > $NC and where it says $COLOR<No SDK>$NC, select latest Android API..." $NC
echo "🔵- If you want to create an emulator, go to $COLOR Tools > AVD Manager > $NC and create a new one. You can download an image from there too." $NC
echo "🔵- If you want to run the app on your phone, you need to enable USB Debugging on your phone, and connect it to your computer." $NC
echo "🛑- If you prefer VSCode. Then I can't help you. Figure it out yourself. You probably need to install Flutter and Dart extensions and stuff..." $NC