if test ! $(which jbcontext); then
  echo "Installing jetbrains context"
  curl -fsSL https://download.jetbrains.com/jetbrains-context/install.sh | bash
else
  echo "Updating jetbrains context"
  jbcontext upgrade
fi
exit 0