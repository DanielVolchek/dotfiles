#!/bin/bash





files=$(find . -type f -name '*.lua' -maxdepth 1 -exec basename {} ';' | sed 's/.lua//')

# format plugins 
for f in $files; do
  mkdir $f
  echo "local plugindir = config.plugindir .. \"$f.\"">> $f/init.lua
  echo "require(plugindir .. \"$f\")" >> $f/init.lua
  mv $f.lua $f
done
