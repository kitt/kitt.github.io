#!/bin/bash

if [ "$VAGRANT" = "true" ]; then

  # if in a vagrant install, don't ssh in, run the jekyll command
  cd ~/refresh
  bundle install

else

  # we are on the host machine, ssh in and run the vagrant command above
  vagrant ssh -c '~/refresh/dev/config-updated.sh'

fi
