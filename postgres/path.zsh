[[ -v POSTGRES_HOMEBREW_VERSION ]] && POSTGRES_HOME=`brew --prefix ${POSTGRES_HOMEBREW_VERSION}` && export PATH=$POSTGRES_HOME/bin:$PATH