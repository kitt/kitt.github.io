#!/bin/bash

if [ "$VAGRANT" = "true" ]; then

  # if in a vagrant install, don't ssh in, run the jekyll command
  cd ~/refresh
  bundle exec jekyll serve --watch --host=0.0.0.0 --force_polling

else

  # we are on the host machine, ssh in and run the vagrant command above
  vagrant ssh -c '~/refresh/dev/start-jekyll.sh'

fi
