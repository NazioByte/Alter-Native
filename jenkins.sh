#!/bin/bash

# ALTERNATIVE_PATH
export ALTERNATIVE_HOME=`pwd`

# ALTERNATIVE_BIN_PATH
export ALTERNATIVE_BIN_PATH=$ALTERNATIVE_HOME/AlterNative.Core.bin/bin/Debug

# ALTERNATIVE_BIN_PATH
export ALTERNATIVE_BIN=$ALTERNATIVE_HOME/AlterNative.Core.bin/bin/Debug/AlterNative.Core.exe

# CPP_LIB_PATH
export ALTERNATIVE_CPP_LIB_PATH=$ALTERNATIVE_HOME/Lib

# ALTERNATIVE_TOOLS
export ALTERNATIVE_TOOLS_PATH=$ALTERNATIVE_HOME/Tools

# Shell Scripts
export PATH=$PATH:$ALTERNATIVE_HOME/Tools/ShellScripts

chmod +x $ALTERNATIVE_HOME/Tools/ShellScripts/alternative

xbuild AlterNative.Core.sln /t:Clean
xbuild AlterNative.Core.sln

cd Lib

if [ -z "$ALTERNATIVE_CPP_LIB_PATH" ]; then
    declare -x ALTERNATIVE_CPP_LIB_PATH=`pwd`
fi

export ALTERNATIVE_LIB_BUILD=$ALTERNATIVE_CPP_LIB_PATH/build
export ALTERNATIVE_LIB_BIN=$ALTERNATIVE_LIB_BUILD/bin



if [ ! -d "$ALTERNATIVE_LIB_BIN" ]; then

  mkdir $ALTERNATIVE_LIB_BIN

fi



cd $ALTERNATIVE_LIB_BIN

rm CMakeCache.txt

cmake -G "Unix Makefiles" ..

make

if [ ! -d "$ALTERNATIVE_LIB_BUILD/libfiles" ]; then

  mkdir $ALTERNATIVE_LIB_BUILD/libfiles
fi

cp $ALTERNATIVE_LIB_BIN/src/libSystem.a $ALTERNATIVE_LIB_BUILD/libfiles
cp $ALTERNATIVE_LIB_BIN/src/public/gc/libgc-lib.a $ALTERNATIVE_LIB_BUILD/libfiles

cd $ALTERNATIVE_CPP_LIB_PATH

cd $ALTERNATIVE_HOME/Tests/public
mono RegressionTest.exe -R

cd $ALTERNATIVE_HOME/Tests/private
mono RegressionTest.exe -R
