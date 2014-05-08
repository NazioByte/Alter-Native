#/bin/bash

# ALTERNATIVE_PATH
declare -x ALTERNATIVE_HOME=`pwd`

# ALTERNATIVE_BIN_PATH
declare -x ALTERNATIVE_BIN_PATH=$ALTERNATIVE_HOME/AlterNative.Core.bin/bin/Debug

# ALTERNATIVE_BIN_PATH
declare -x ALTERNATIVE_BIN=$ALTERNATIVE_HOME/AlterNative.Core.bin/bin/Debug/AlterNative.Core.exe

# CPP_LIB_PATH
declare -x ALTERNATIVE_CPP_LIB_PATH=$ALTERNATIVE_HOME/Lib

# Shell Scripts
PATH=$PATH:$ALTERNATIVE_HOME/Tools/ShellScripts
