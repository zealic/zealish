: << EOF
::=========================================================
:: BEGIN BATCH
::=========================================================
@echo off
pushd "%~dp0"
if "%TERM%" EQU "" (
  powershell -File "%cd%\share\startup.ps1"
  @goto :eof
)
@bash "%~dp0\%~nx0" "%cd%" "%~dp0"
popd
@goto :eof
EOF
#!/bin/sh
#=========================================================
# BEGIN SHELL
#=========================================================
if [ "$(uname -s)" == "Darwin" ]; then
  _OS_NAME=darwin
elif [ "$(uname -s)" == "Linux" ]; then
  _OS_NAME=linux
elif [ "$(uname -s)" == "FreeBSD" ]; then
  _OS_NAME=freebsd
elif [ "$(uname -o)" == "Msys" ]; then
  _OS_NAME=msys
elif [ "$(uname -o)" == "Cygwin"]; then
  _OS_NAME=cygwin
else
  echo "Not supported system."
  exit 1
fi
"$PWD/share/startup.sh" "$_OS_NAME"
