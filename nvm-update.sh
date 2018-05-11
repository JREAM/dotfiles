#!/bin/bash
#
# I use this when I update NodeJS as the versions climb fairly fast.
# These are only Global files I install with my installation after removing a previous one.
# - Jesse Boyer <JREAM.com>
#


# Package List (These are all global)
PACKAGES=(

  # ---------------
  # Babel
  # ---------------
  babel-cli
  babel-core
  # babel-eslint        # (Use per-project)
  # babel-loader        # (Use per-project)
  babel-preset-env

  # ---------------
  # Ecma Abilities
  # ---------------
  cross-env
  es2015
  es2016
  es2017
  es6
  es6-promise

  # ---------------
  # Linters/Helpers
  # ---------------
  babel-eslint
  eslint
  eslint-config-eslint
  eslint-loader
  eslint-plugin-babel
  eslint-plugin-html
  eslint-plugin-react
  eslint-plugin-import
  # grunt-eslint      # (Use per-project)
  # gulp-eslint       # (Use per-project)
  prettier
  remark-lint         # Markdown Lint
  # sass-lint         # (Use per-project)
  tslint              # Typescript Lint

  # ---------------
  # Dependencies for eslint-config-standard
  # ---------------
  eslint-plugin-import
  eslint-plugin-node
  eslint-plugin-promise

  # ---------------
  # Config Setting Standards
  # ---------------
  eslint-config-airbnb-base
  eslint-config-airbnb
  eslint-config-standard

  # ---------------
  # Testing/Coverage
  # ---------------
  chai
  expect.js
  jest
  mocha
  sinon

  # ---------------
  # Debug Server / System Runner
  # ---------------
  #nodemon
  pm2

  # ---------------
  # Other
  # ---------------
  tsutils
  typescript


  # ---------------
  # CLI Tools / Builders
  # ---------------
  feathers-cli
  strapi
  chalk
  yo
  generator-generator  # yeoman helper custom generator
  grunt-cli
  gulp
  gulp-cli
  karma-cli
  # parcel-bundler      # (Use per-project)
  # rollup              # (Use per-project)
  webpack-cli
  webpack
  # webpack-dev-server  # (Use per-project)

  # ---------------
  # FrontEnd
  # ---------------
  @angular/cli
  vue-cli
  create-react-app
  jscodeshift         # Make changes to code nicely

  # ---------------
  # System CLI Utils
  # ---------------
  #fkill-cli
  #localtunnel
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
read -ep "(1/2) Install above libs for the current Node version? [ Y/n ]: " yn
read -ep "(2/2) Use Yarn (Default) or npm? [yarn/npm]: " yarnnpm

if [[ $yn =~ ^[nN]$ ]]; then
  echo -e "Exiting ..."
  exit 1
fi

echo $yarnnpm

PACKAGE_CONTROL='yarn'
if [ "$yarnnpm" = "npm" ]; then
  PACKAGE_CONTROL='npm'
fi

echo -e "${GRN}══════════════════════════════════════════════════════════════════════${NC}"
echo -e "${GRN}Preparing to install using: ${PACKAGE_CONTROL}. CTRL+C to cancel${NC}"
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
  if [ "$PACKAGE_CONTROL" = "npm" ]; then
    echo "NPM ${p}"
    npm i -g $p
    continue
  fi
  yarn global add $p
done
  #fi

echo -e "${GRN}Finished.. If you had errors, please check them manually."

if [[ $PACKAGE_CONTROL -eq "yarn" ]]; then
  echo -e "${GRN}[!] For Yarn, make sure to add to your .bashrc or a sourced file to load the files:"
  echo -e "\t [[ -d ~/.yarn/bin ]] && export PATH=$PATH:~/.yarn/bin"
fi
