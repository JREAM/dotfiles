# ESLint Configurations

These are my preferred configurations.

- [ESLint Configurations](#eslint-configurations)
- [Config: ESLint](#config-eslint)
  - [Install](#install)
  - [Babel](#babel)
  - [Unit Testing](#unit-testing)
  - [BDD Testing](#bdd-testing)
    - [Example Nightwatch File](#example-nightwatch-file)
- [Config: ESLint React](#config-eslint-react)

---

# Config: ESLint

**.eslintrc**
```json
{
  "root": true,
  "parser": "babel-eslint",
  "plugins": [
    "import"
  ],
  "extends": [
    "eslint:recommended"
  ],
  "env": {
    "browser": true,
    "node": true
  },
  "globals": {
    "lodash": true,
    "jquery": true,
    "moment": true
  },
  "parserOptions": {
    "ecmaVersion": 2018,
    "ecmaFeatures": {
      "impliedStrict": false
    },
    "sourceType": "module"
  },
  "rules": {
    "camelcase": [
      2,
      {
        "properties": "always"
      }
    ],
    "comma-dangle": [
      "error",
      {
        "arrays": "always-multiline",
        "objects": "always-multiline",
        "imports": "always-multiline",
        "exports": "always-multiline",
        "functions": "ignore"
      }
    ],
    "arrow-body-style": [
      "error",
      "always"
    ],
    "array-bracket-spacing": [
      2,
      "always"
    ],
    "eol-last": 2,
    "eqeqeq": 2,
    "indent": [
      2,
      2
    ],
    "linebreak-style": [
      2,
      "unix"
    ],
    "no-console": 0,
    "no-else-return": 2,
    "no-extra-bind": 2,
    "no-extra-parens": 2,
    "no-extra-semi": 2,
    "no-multi-spaces": 2,
    "no-underscore-dangle": 0,
    "no-useless-constructor": 2,
    "no-var": 2,
    "prefer-const": 2,
    "prefer-template": 2,
    "quotes": [
      2,
      "single"
    ],
    "semi": [
      2,
      "always"
    ],
    "wrap-iife": 2,
    "yoda": [
      2,
      "never"
    ]
  }
}
```

## Install

```sh
 yarn add -D
    @babel/core \
    @babel/cli \
    babel-eslint \
    babel-preset-env \
    eslint \
    eslint-config-eslint \
    eslint-plugin-import \
    eslint-plugin-node@^6.0.1
```
## Babel

**.babelrc**
```sh
    echo '{`presets": ['env']}' > .babelrc
```

You may also do the following:
```json
  "scripts": {
    "start": "babel-node file.js"
  }
```

## Unit Testing

```sh
yarn add -D mocha \
  chai \
  sinon
```

## BDD Testing

> Gecko is FireFox

http://nightwatchjs.org/gettingstarted/#browser-drivers-setup

```sh
yarn add -D nightwatch \
  chromedriver
  geckodriver
```

### Example Nightwatch File

```js
module.exports = {
  'webdriver': {
    'server_path': 'node_modules/.bin/chromedriver',
    'cli_args': [
      '--verbose',
    ],
    'port': 9515,
  },
  'test_settings': {
    'default': {
      'desiredCapabilities': {
        'browserName': 'chrome',
      },
    },
  },
};
```

# Config: ESLint React

**.eslintrc**

```json
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended"
  ],
  "settings": {
    "react": {
      "createClass": "createReactClass",
      "pragma": "React",
      "version": "detect"
    }
  },
  "parserOptions": {
    "ecmaVersion": 2018,
    "ecmaFeatures": {
      "jsx": true
    },
    "sourceType": "module"
  },
  "env": {
    "browser": true,
    "node": true
  },
  "rules": {
    "array-bracket-newline": [
      0,
      {
        "multiline": 0
      }
    ],
    "brace-style": [
      2,
      "1tbs"
    ],
    "comma-dangle": [
      2,
      "only-multiline",
      {
        "functions": "never"
      }
    ],
    "eol-last": [
      2,
      "always"
    ],
    "semi": [
      0,
      "never",
      {
        "omitLastInOneLineBlock": true
      }
    ],
    "quotes": [
      2,
      "single"
    ],
    "react/button-has-type": [
      0,
      {
        "button": false,
        "submit": false,
        "reset": false
      }
    ],
    "react/destructuring-assignment": 2,
    "react/no-multi-comp": [
      2,
      {
        "ignoreStateless": true
      }
    ],
    "react/no-typos": 1,
    "react/prefer-es6-class": [
      2,
      "always"
    ],
    "react/require-render-return": [
      2
    ],
    "react/jsx-equals-spacing": [
      2,
      "never"
    ],
    "react/jsx-handler-names": [
      2,
      {
        "eventHandlerPrefix": "on",
        "eventHandlerPropPrefix": "handle"
      }
    ],
    "react/jsx-indent": [
      2,
      2
    ],
    "react/jsx-indent-props": [
      2,
      2
    ],
    "react/jsx-no-bind": [
      2,
      {
        "ignoreDOMComponents": false,
        "ignoreRefs": false,
        "allowArrowFunctions": false,
        "allowFunctions": false,
        "allowBind": false
      }
    ],
    "react/jsx-no-duplicate-props": [
      2,
      {
        "ignoreCase": false
      }
    ],
    "react/jsx-pascal-case": [
      2,
      {
        "allowAllCaps": false
      }
    ],
    "react/jsx-sort-props": [
      0,
      {
        "callbacksLast": false,
        "shorthandFirst": false,
        "shorthandLast": true,
        "ignoreCase": true,
        "noSortAlphabetically": false
      }
    ],
    "react/jsx-tag-spacing": {
      "closingSlash": "never",
      "beforeSelfClosing": "always",
      "afterOpening": "never",
      "beforeClosing": "allow"
    },
    "react/jsx-uses-react": 2,
    "react/jsx-uses-vars": [
      1,
      "always"
    ]
  }
}
```

---
MIT

(c) 2019 / Jesse Boyer <JREAM>
