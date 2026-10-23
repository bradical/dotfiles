# X11 display for Java GUI tools (e.g. VisualVM); don't clobber XQuartz/SSH values
export DISPLAY=${DISPLAY:-:0}
