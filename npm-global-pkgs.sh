#!/bin/bash
#
# @description  When installing many packages I re-use, this script runs for me.
# These are only for GLOBAL files.
#
# @using  nvm  Node Version Manager
# @author Jesse Boyer  JREAM.com
#


# Package List (These are all global)
PACKAGES=(

  # --------------
  # Update NPM
  # --------------
  npm@latest

  # ---------------
  # Dep. Checkers
  # ---------------
  npm-check
  yarn-check

  # ---------------
  # Babel
  # ---------------
  @babel/cli
  @babel/core
  babel-eslint              # (Use per-project)
  # babel-loader            # (Use per-project)
  # babel-preset-env        # (Use per-project)

  # Like Webpack/Gulp but Easy and not too basic as parcel
  brunch

  netlify
  netlify-lambda
  # netlify-cms             # (Use per-project)

  # ---------------
  # Ecma Abilities
  # ---------------
  # cross-env               # (Use per-project)

  # ---------------
  # Linters/Helpers
  # ---------------
  # babel-eslint
  # eslint-config-eslint
  # eslint-plugin-import
  # eslint-plugin-node
  # eslint-plugin-promise
  # eslint-loader             # (Use per-project/webpack)
  # eslint-plugin-babel       # (Use per-project/webpack)
  # eslint-plugin-html        # (Use per-project/webpack)
  # eslint-plugin-react       # (Use per-project/webpack)

  eslint
  jshint
  jslint
  stylelint
  # stylelint-config-recommended
  prettier
  @starptech/prettyhtml     # Works w/Vue, Angular, React
  remark-lint               # Markdown Lint
  sass-lint                 # SASS Lint
  tslint                    # Typescript Lint

  # ---------------
  # Testing/Coverage
  # ---------------
  ndb
  chai
  mocha
  sinon

  # ---------------
  # Debug Server / System Runner
  # ---------------
  nodemon
  pm2
  serve

  # ---------------
  # Other
  # ---------------
  tsutils
  typescript

  # ---------------
  # CLI Tools
  # ---------------
  @feathersjs/feathers
  @gridsome/cli           # (Vue Page Builder) Much like Gatsby
  gatsby                  # (React Page Builder) Gatsby is Awesome
  generator-generator     # yeoman helper custom generator
  # grunt-cli
  gulp-cli
  strapi@alpha
  types-installer         # types-installer | types-installer install
  yo                      # yeoman
  npm-ls-scripts          # Read package.json scripts ( $ ls-scripts )

  # ---------------
  # Runners & Bundlers
  # ---------------
  poi                     # bundler
  parcel-bundler          # bundler
  rollup                  # bundler
  webpack-cli             # bundler
  webpack@next            # bundler
  # webpack-dev-server    # bundler (Use per-project)

  # ---------------
  # FrontEnd
  # ---------------
  # @angular/cli
  @vue/cli
  @vue/cli-init
  # vuepress
  create-react-app
  create-next-app
  jscodeshift         # Make changes to code nicely


  # ---------------
  # Misc Tools
  # ---------------
  firebase-tools
)

# A few Colors
NC="\033[0m";
RED="\033[0;31m";
YLW="\033[1;33m";
GRN="\033[1;32m";
BOLD="\033[1m";

VERSION=$(node --version)

# Friendly Output Reminder
echo -e "--> $YLW Your current active Node is set to: $GRN $VERSION $NC"
echo -e "══════════════════════════════════════════════════════════════════════"
echo -e "--> To Upgrade and/or Check Version:"
echo -e "--> [?] If you haven't updaed, do the following:"
echo -e "    ..   $ nvm ls-remote --> to see the latest version."
echo -e "    ..   $ nvm install v8.X.X"
echo -e "    ..   $ nvm alias default v8.X.X  --> sets the deafult version"
echo -e "    ..   (!) ENSURE (!) Open a new terminal and type: $ node --version  -->  to ensure it's set correctly"
echo -e ""

echo -e "$GRN══════════════════════════════════════════════════════════════════════"
echo -e " Packages To Install Globally:"
echo -e "══════════════════════════════════════════════════════════════════════$NC"

# Easier to read output
for value in "${PACKAGES[@]}"; do
  printf "${YLW}%-8s${NC}\n" "${value}"
done | column

#DISPLAY_OUTPUT=$( IFS=$'\n'; echo "${PACKAGES[*]}" )
echo -e "$YLW $DISPLAY_OUTPUT $NC"
echo -e "$GRN══════════════════════════════════════════════════════════════════════$NC"

# Prompt Before Installation
read -ep "[?] Install above libs for the current Node version? [ Y/n ]: " yn

if [[ $yn =~ ^[nN]$ ]]; then
  echo -e "Exiting ..."
  exit 1
fi

echo -e "$GRN══════════════════════════════════════════════════════════════════════"
echo -e " Preparing to install. ${BOLD}CTRL+C${NC}$GRN to cancel"
echo -e "══════════════════════════════════════════════════════════════════════$NC"


# Brief Timeout incase mind is changed, regardless this is all no big deal.
TIMEOUT=3
echo -e "$YLW[+] Running in $TIMEOUT seconds... ( CTRL+C to cancel )$NC"
while [ $TIMEOUT -gt 0 ]; do
  sleep 1
  : $((TIMEOUT--))
done

for p in "${PACKAGES[@]}"
do
    echo -e "$YLW[+] Installing: npm install --global $BOLD $p $NC"
    npm i -g $p
    continue
done

echo -e "$GRN[+] Finished.. If you had errors, please check them manually."
