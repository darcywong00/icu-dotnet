#!/bin/bash
# Get the proper ICU version number for the local machine
# Versions reported include 4.6.y.z, 4.8.y.z, 49.x.y.z, 50.x.y.z, 51.x.y.z, 52.x.y.z, ...
# ICU appears to be on a 6-month release cycle, incrementing the main version number by one each time
# (version 53 released April 2014, version 54 scheduled for October 2014)
ICUVER=$(icu-config --version|tr -d .|cut -c -2)
cd "$(dirname "$0")"
xbuild /t:${2:-Build} /p:icu_ver=$ICUVER /p:Configuration=${1:-Debug} /p:teamcity_build_checkoutDir=$(dirname $(pwd)) /p:teamcity_dotnet_nunitlauncher_msbuild_task="notthere" /p:BUILD_NUMBER="0.1.0.abcd" /p:Minor="1" build.mono.proj
