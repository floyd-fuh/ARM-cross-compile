#!/bin/bash

echo "[INFO] Checking if packages installed"
dpkg --status autoconf | grep -q not-installed
if [ $? -eq 0 ]; then
    echo "[INFO] Apt-get installing autoconf, please provide sudo password"
    sudo apt-get install autoconf
else
    echo "[INFO] autoconf already installed, good"
fi
dpkg --status gcc-arm-linux-gnueabi | grep -q not-installed
if [ $? -eq 0 ]; then
    echo "[INFO] Apt-get installing gcc-arm-linux-gnueabi, please provide sudo password"
    sudo apt-get install gcc-arm-linux-gnueabi
else
    echo "[INFO] gcc-arm-linux-gnueabi already installed, good"
fi

CC=`which arm-linux-gnueabi-gcc`


#Hello world in C
echo "#include <stdio.h>" > hello.c
echo "" >> hello.c
echo "int main(void)" >> hello.c
echo "{" >> hello.c
echo '  printf("Hello, World\n");' >> hello.c
echo "return 0;" >> hello.c
echo "}" >> hello.c
$CC -static -o hello-unstripped.bin hello.c
arm-linux-gnueabi-strip -o hello.bin -s hello-unstripped.bin
rm hello-unstripped.bin
file hello.bin | grep -q ARM
#End hello world compilation


if [ ! $? -eq 0 ]; then
    echo "[ERROR] Looks like the binary was incorrectly compiled with another compler than arm-linux-gnueabi-gcc"
    echo "[ERROR] The resulting binary will not run on ARM, therefore aborting!"
    exit
fi
echo "[INFO] Your binary is finished, happy hacking on ARM!"
