#!/bin/bash
# Script to setup Babel
# Written by, Addison Coquillette-Day

# Define replacement strings in package.json
RE='"[a-z]*":\s"[a-z]*\s."\w*:\s\w*\s\w*\s\w*."\s..\s\w*\s[0-9]"'
BUILD="\"build\": \"babel src -d lib\""

echo "[-- Setting up Babel --]"
echo "[-- Creating src directory... --]"
mkdir -p babel-setup/src
cd babel-setup/
echo
echo "[-- Creating README... --]"
touch README.md
echo "[-- Configuring project... --]"
npm init -y
echo
echo "[-- Setting build command in package.json --]"
sed -i "s/$RE/$BUILD/g" package.json
echo "[-- Installing Babel CLI and env preset --]"
echo
npm install --save-dev babel-cli babel-preset-env
echo
touch .babelrc
echo "{
  \"presets\": [\"env\"]
}" > .babelrc
echo "[-- Done... --]"
