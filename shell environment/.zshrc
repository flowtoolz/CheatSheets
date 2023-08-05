# add some binary paths
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/opt/homebrew/bin"

# Java / Android / Flutter
export PATH=$PATH:/usr/libexec/java_home/
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@11/11.0.19/libexec/openjdk.jdk/Contents/Home

export ANDROID_HOME=/Users/seb/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/seb/Desktop/flutter/bin

# load shell customization
scriptsFolder="/Users/seb/Desktop/GitHub Repos/CheatSheets/shell-customization-scripts"
source "$scriptsFolder/make-the-shell-great-again.sh"
source "$scriptsFolder/personalize-the-shell.sh"

# Ruby Version Manager. Make sure this is the last PATH variable change!
export PATH="$PATH:$HOME/.rvm/bin"