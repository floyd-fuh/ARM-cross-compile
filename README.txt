----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 42):
<floyd at floyd dot ch> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return (I like Ales and Stouts)
floyd https://floyd.ch @floyd_ch <floyd at floyd dot ch>
November 2017
----------------------------------------------------------------------------

Cross compile binaries for ARM (eg. Android) from your x86 Ubuntu machine

These scripts only work on Ubuntu, tested only on Ubuntu 11.04

The template can be used to build your own compilation scripts. If it's run as is, it will compile a hello world ARM binary.

The bash script will download the bash-4.0 source code and compile it to an ARM binary.

So far, everything is statically linked.

See also http://www.floyd.ch/?p=330