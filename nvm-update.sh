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

  # Babel
  babel-cli
  babel-core
  babel-eslint
  babel-loader
  babel-preset-env
  grunt-babel
  gulp-babel

  # Ecma Abilities
  core-js
  cross-env
  es2015
  es2016
  es2017
  es6
  es6-promise
  lodash
  lodash-es

  # Linters/Helpers
  eslint
  eslint-config-eslint
  eslint-loader
  eslint-plugin-babel
  eslint-plugin-html
  eslint-plugin-lodash
  eslint-plugin-mocha
  eslint-plugin-prettier
  grunt-eslint
  gulp-eslint
  htmlhint
  remark-lint
  sass-lint
  tslint

  # Dependencies for eslint-config-standard
  eslint-plugin-import
  eslint-plugin-node
  eslint-plugin-promise

    # Config Setting Standards
    eslint-config-airbnb-base
    eslint-config-airbnb
    eslint-config-standard

  # Testing/Coverage
  chai
  expect.js
  jest
  mocha
  sinon

  # Debug Server / System Runner
  nodemon
  pm2

  # Other
  tsutils
  typescript


  # CLI Tools / Builders
  @angular/cli
  feathers-cli
  strapi
  chalk
  express-generator
  create-react-app
  generator-generator  # yeoman helper custom generator
  grunt-cli
  gulp
  gulp-cli
  karma-cli
  parcel-bundler
  rollup
  vue-cli
  webpack
  webpack-dev-server

    # System CLI Utils
    fkill-cli
    localtunnel
    vtop
)

# A few Colors
NC="\033[0m";
RED="\033[0;31m";
YLW="\033[1;33m";
GRN="\033[1;32m";

VERSION=$(node --version)

# Friendly Output Reminder
echo -e "--> ${YLW}Your current active Node is set to: ${GRN} ${VERSION} ${NC}"
echo -e "══════════════════════════════════════════════════════════════════════"
echo -e "--> To Upgrade and/or Check Version:"
echo -e "--> [?] If you haven't updaed, do the following:"
echo -e "    ..   $ nvm ls-remote --> to see the latest version."
echo -e "    ..   $ nvm install v8.X.X"
echo -e "    ..   $ nvm alias default v8.X.X  --> sets the deafult version"
echo -e "    ..   (!) ENSURE (!) Open a new terminal and type: $ node --version  -->  to ensure it's set correctly"
echo -e ""

echo -e "${GRN}══════════════════════════════════════════════════════════════════════"
echo -e "Packages To Install Globally:"
echo -e "══════════════════════════════════════════════════════════════════════${NC}"

# Easier to read output
for value in "${PACKAGES[@]}"; do
  printf "${YLW}%-8s${NC}\n" "${value}"
done | column

#DISPLAY_OUTPUT=$( IFS=$'\n'; echo "${PACKAGES[*]}" )
echo -e "${YLW}${DISPLAY_OUTPUT} ${NC}"
echo -e "${GRN}══════════════════════════════════════════════════════════════════════${NC}"

# Prompt Before Installation
read -ep "--> Install all of the dependencies for this Node version? [ y/N ]: " yn

if [[ $yn =~ ^[yY]$ ]]; then

  echo -e "${GRN}══════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${GRN}Preparing to install, you may CTRL+C to cancel${NC}"
  echo -e "${GRN}══════════════════════════════════════════════════════════════════════${NC}"


  # Brief Timeout incase mind is changed, regardless this is all no big deal.
  TIMEOUT=4
  while [ $TIMEOUT -gt 0 ]; do
    echo -e "${YLW}Running in ${TIMEOUT} seconds ... ( CTRL+C to cancel )${NC}"
    sleep 1
    : $((TIMEOUT--))
  done

  # @NOTE: Not using YARN for global, installs in place I do not want
  # Strip the /bin off the end (4 chars)
  #NODE_MODULES_PATH=${NVM_BIN%????}

  #YARN=0
  #if hash yarn 2>/dev/null; then
  #  YARN=1
  #fi

  # Much faster than iterating, though a broken packages will not run any.
  # @TODO This is not reliable so far, lame!
  #PACKAGES_STR="${PACKAGES[@]}"

  #if [[ $YARN == 1 ]]; then
  #  yarn global add $PACKAGES_STR
  #else
  for p in "${PACKAGES[@]}"
  do
    npm i -g $p
  done
  #fi

  echo -e "${GRN}Finished.. If you had errors, please check them manually"

fi
