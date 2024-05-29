#!/usr/bin/env bash

if [ "$1" == "-h" ]; then #https://stackoverflow.com/a/30830291
  echo "Usage: $(basename "$0") [-b/--build]"
  exit 0
fi

if [ "$1" != "-h" ]; then
  echo "====  RUN SERVER ===="
  if command -v jekyll >/dev/null 2>&1
  then
    bundle exec jekyll serve --baseurl=""
  else
    echo "jekyll required but it's not installed. Skipping."
    echo "Run as: brew install ruby && gem update --system 3.4.12 && gem install --user-install bundler jekyll  "
    echo "If some errors, please: bundle install && bundle add webrick" # https://stackoverflow.com/a/70916831
    echo "More information: https://jekyllrb.com/ or https://rvm.io/"
    # https://mac.install.guide/ruby/index.html
    # ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22] -> ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin22]
    
    # Modify homebrew/lib/ruby/gems/3.2.0/gems/compass-1.0.3/lib/compass/configuration/helpers.rb: undefined method `exists?' for File:Class -> to exist
    # The same for
    # homebrew/lib/ruby/gems/3.2.0/gems/compass-1.0.3/lib/compass/commands/project_base.rb: undefined method `exists?' for File:Class
    # homebrew/lib/ruby/gems/3.2.0/gems/compass-1.0.3/lib/compass/commands/update_project.rb: undefined method `exists?' for File:Class
    # DEPRECATION WARNING on line 87 of homebrew/lib/ruby/gems/3.2.0/gems/compass-core-1.0.3/stylesheets/compass/css3/_deprecated-support.scss:
  fi
fi
