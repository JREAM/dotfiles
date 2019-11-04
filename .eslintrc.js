/* eslint-disable */
/**
 * JavaScript and/or React Configuration
 * (c) Copyright 2019 Jesse Boyer <JREAM> | Open Source MIT
 * __________________________________________________________________
 * @help
 *    allowed filenames:
 *      - .eslintrc
 *      - .eslintrc.js
 *      - .eslintrc.yml
 *      - .eslintrc.yaml
 * @docs eslint configuration
 *      - configuring:  https://eslint.org/docs/user-guide/configuring/
 *      - formatters:   https://eslint.org/docs/user-guide/formatters/
 *      - integrations: https://eslint.org/docs/user-guide/integrations
 * __________________________________________________________________
 * @docs eslintignore configuration (.eslintignore):
 *    https://eslint.org/docs/user-guide/configuring#ignoring-files-and-directories
 *
 * @defaults
 * @note For typehinting in VSCode include typescript (optional)
 *
 *
 * @for installation: javascript
 * __________________________________________________________________
 *    $ yarn add -D \
 *      eslint \
 *      typescript \
 *      babel-eslint \
 *      eslint-plugin-import \
 *      eslint-config-eslint
 *
 * @for installation: create-react-app
 * @note make sure to go below and uncomment react items.
 * __________________________________________________________________
 *    $ yarn add -D \
 *      eslint \
 *      typescript \
 *      eslint-plugin-import \
 *      eslint-plugin-react \
 *      eslint-plugin-react-hooks \
 *      eslint-config-eslint \
 *      eslint-config-react
 */
module.exports = {
  /**
   * @section parser
   * @note Do not add NPM Package babel-eslint using create-react-app (It's built in)
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#specifying-parser
   */
  parser: "babel-eslint",

  /**
   * @section extends
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#using-eslintrecommended
   *
   *    preact:
   *      $ yarn add -D eslint-config-synacor
   *      > extends: ['synacor'],
   */
  extends: ["eslint:recommended"],

  plugins: [
    /**
     * @section plugins
     * @docs
     *    https://eslint.org/docs/user-guide/configuring#using-the-configuration-from-a-plugin
     *
     *    react:
     *      $ yarn add -D eslint-plugin-react
     *      > plugins: ['react', 'react-hooks'],
     */
    "react",
    "react-hooks"
  ],

  /**
   * @section env
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#specifying-environments
   */
  env: {
    browser: true,
    es6: true,
    jest: true,
    node: true
  },

  /**
   * @section parserOptions
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#specifying-parser-options
   */
  parserOptions: {
    ecmaFeatures: {
      modules: true,
      jsx: true
    }
  },

  /**
   * @section settings
   * @docs
   *    https://...
   */
  settings: {
    react: {
      // pragma: 'h',        // @for preact
      version: "detect" // @required fpr react
    }
  },

  globals: {
    /**
     * @section globals
     * @docs
     *    https://eslint.org/docs/user-guide/configuring#specifying-globals
     */
  },
  rules: {
    /**
     * @section rules
     * @docs
     *    https://eslint.org/docs/rules/
     */
    "arrow-parens": 2,
    camelcase: 0,
    "comma-dangle": [2, "always-multiline"],
    "comma-style": 2,
    "constructor-super": 2,
    eqeqeq: 1,
    "guard-for-in": 2,
    "handle-callback-err": 0,
    indent: [2, "tab", { SwitchCase: 1 }],
    "keyword-spacing": 2,
    "max-nested-callbacks": [2, 4],
    "no-cond-assign": 1,
    "no-console": 0,
    "no-const-assign": 2,
    "no-delete-var": 2,
    "no-dupe-class-members": 2,
    "no-dupe-keys": 2,
    "no-var": 2,
    "no-else-return": 2,
    "no-empty-pattern": 0,
    "no-empty": 0,
    "no-eval": 2,
    "no-implied-eval": 2,
    "no-lonely-if": 2,
    "no-new-func": 2,
    "no-redeclare": 2,
    "no-shadow-restricted-names": 2,
    "no-shadow": 0,
    "no-this-before-super": 2,
    "no-trailing-spaces": [2, { skipBlankLines: true }],
    "no-undef-init": 2,
    "no-useless-concat": 2,
    "no-var": 2,
    "object-shorthand": 2,
    "prefer-arrow-callback": 2,
    "prefer-spread": 2,
    quotes: [2, "single"],
    radix: 2,
    semi: 2,
    strict: [2, "never"],

    /**
     * @section rules/react
     * @docs
     *    https://github.com/yannickcr/eslint-plugin-react#list-of-supported-rules
     *    https://github.com/yannickcr/eslint-plugin-react#jsx-specific-rules
     */
    "react/jsx-curly-spacing": 2,
    "react/jsx-no-bind": [2, { ignoreRefs: true }],
    "react/jsx-no-comment-textnodes": 2,
    "react/jsx-no-duplicate-props": 2,
    "react/jsx-no-undef": 2,
    "react/jsx-uses-react": 2,
    "react/jsx-uses-vars": 2,
    "react/no-find-dom-node": 2,
    "react/no-is-mounted": 2,
    "react/no-string-refs": 2,
    "react/prefer-es6-class": 2,
    "react/require-render-return": 2,
    "react/self-closing-comp": 2,

    /**
     * @section rules/react-hooks
     */
    "react-hooks/rules-of-hooks": "error", // Checks rules of Hooks
    "react-hooks/exhaustive-deps": "warn" // Checks effect dependencies
  }
};
