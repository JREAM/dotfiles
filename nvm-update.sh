#!/bin/bash
#
# I use this when I update NodeJS as the versions climb fairly fast.
# These are only Global files I install with my installation after removing a previous one.
# - Jesse Boyer <JREAM.com>
#


# Package List (These are all global)
PACKAGES=(
  # See https://blogs.windows.com/msedgedev/2017/08/10/es-modules-node-today/
  @std/esm
  # Ecma Abilities
  babel-cli
  babel-core
  babel-eslint
  babel-loader
  babel-polyfill
  babel-preset-env
  chalk
  colors
  core-js
  lodash
  cross-env
  csslint
  es2015
  es2016
  es2017
  es2018
  esnext
  es6
  es6-promise
  eslint
  eslint-config-eslint
  eslint-loader
  eslint-plugin-babel
  eslint-plugin-html
  eslint-plugin-prettier
  eslint-plugin-lodash
  eslint-plugin-mocha
  eslint-plugin-react-native
  # Dependencies for eslint-config-standard
  eslint-plugin-import
  eslint-plugin-node
  eslint-plugin-promise
  eslint-plugin-react
  # Config Setting Standards
  eslint-config-airbnb
  eslint-config-standard
  eslint-config-standard-react
  eslint-config-google
  # Markdown Linter
  remark-lint
  express-generator
  grunt-cli
  grunt-babel
  grunt-eslint
  gulp
  gulp-babel
  gulp-eslint
  gulp-jshint
  # Linters/Helpers
  htmlhint
  htmlhint-cli
  jscs
  jshint
  jshint-stylish
  jslint
  jsxhint
  # Testing/Coverage
  minimatch
  sinon
  expect.js
  mocha
  mocha-jshint
  phplint
  # Other
  pm2
  postcss
  sass-lint
  stylelint
  stylelint-scss
  standard
  tslint
  typescript
  # CLI Tools or Builders
  @angular/cli
  vue-cli
  rollup
  webpack
)

# A few Colors
NC="\033[0m";
RED="\033[0;31m";
YLW="\033[1;33m";
GRN="\033[1;32m";

VERSION=$(node --version)

# Friendly Output Reminder
echo -e "--> ${YLW}Your current active Node is set to: ${GRN} ${VERSION} ${NC}"
echo -e "---------------------------------------------------------------------"
echo -e "--> To Upgrade and/or Check Version:"
echo -e "--> [?] If you haven't updaed, do the following:"
echo -e "    ..   $ nvm ls-remote --> to see the latest version."
echo -e "    ..   $ nvm install v8.X.X"
echo -e "    ..   $ nvm alias default v8.X.X  --> sets the deafult version"
echo -e "    ..   (!) ENSURE (!) Open a new terminal and type: $ node --version  -->  to ensure it's set correctly"
echo -e "---------------------------------------------------------------------"

echo -e "${GRN}---------------------------------------------------------------------"
echo -e "Packages To Install Globally:"
echo -e "---------------------------------------------------------------------${NC}"

# Easier to read output
DISPLAY_OUTPUT=$( IFS=$'\n'; echo "${PACKAGES[*]}" )
echo -e "${YLW}${DISPLAY_OUTPUT} ${NC}"
echo -e "---------------------------------------------------------------------${NC}"

# Prompt Before Installation
read -ep "--> Install all of the dependencies for this Node version? [y/N]: " yn

if [[ $yn =~ ^[yY]$ ]]; then

  echo -e "---------------------------------------------------------------------${NC}"
  echo -e "${GRN}Preparing to install, you may CTRL+C to cancel${NC}"
  echo -e "---------------------------------------------------------------------${NC}"


  # Brief Timeout incase mind is changed, regardless this is all no big deal.
  TIMEOUT=10
  while [ $TIMEOUT -gt 0 ]; do
    echo -e "${YLW}Running in ${TIMEOUT} seconds ... ( CTRL+C to cancel )${NC}"

    sleep 1
    : $((TIMEOUT--))
  done

  # The shorthand to install each item
  for i in "${PACKAGES[@]}"; do
    npm i ${i} -g
  done

  echo -e "${GRN}Finished.. If you had errors, please check them manually"

fi
