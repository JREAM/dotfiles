/**
 * __________________________________________________________________
 * @help
 *    Acceteptable filenames:
 *      - .eslintrc
 *      - .eslintrc.js
 *      - .eslintrc.yml/yaml
 * @docs ESLint Configuration
 *    configuring:    https://eslint.org/docs/user-guide/configuring/
 *    formatters:     https://eslint.org/docs/user-guide/formatters/
 *    integrations:   https://eslint.org/docs/user-guide/integrations
 * __________________________________________________________________
 * @docs ESLint Ignore (.eslintignore):
 *    https://eslint.org/docs/user-guide/configuring#ignoring-files-and-directories
 *
 * @defaults
 *    $ yarn add -D  babel-eslint eslint-plugin-import eslint-config-eslint
 */
module.exports = {

  /**
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#specifying-parser
   */
  parser: "babel-eslint",
  /**
   * @docs
   *    https://eslint.org/docs/user-guide/configuring#using-eslintrecommended
   *
   *    preact    $ yarn add -D eslint-config-synacor
   * > extends: ["eslint:recommended", "synacor"],
   *
   *    eslint    $ yarn add -D eslint-config-eslint
   */
  extends: ["eslint:recommended"],

  plugins: [
    /**
     *  @docs
     *    https://eslint.org/docs/user-guide/configuring#using-the-configuration-from-a-plugin
     *    react     $ yarn add -D eslint-plugin-react
     *
     * "react"
     */
  ],
  env: {
    /**
     * @docs
     *    https://eslint.org/docs/user-guide/configuring#specifying-environments
     */
    browser: true,
    node: true,
    es6: true,
    jest: true
  },
  parserOptions: {
    /**
     * @docs
     *    https://eslint.org/docs/user-guide/configuring#specifying-parser-options
     */
    ecmaFeatures: {
      modules: true,
      jsx: true
    }
  },
  // "settings": {
    // "react": {
      // Preact
      // "pragma": "h"
    // }
  // },
  globals: {
    /**
     * @docs
     *    https://eslint.org/docs/user-guide/configuring#specifying-globals
     */
  },
  rules: {
    /**
     * @docs
     *    https://eslint.org/docs/rules/
     */
    "react/jsx-no-bind": [2, { "ignoreRefs": true }],
    "react/jsx-no-duplicate-props": 2,
    "react/self-closing-comp": 2,
    "react/prefer-es6-class": 2,
    "react/no-string-refs": 2,
    "react/require-render-return": 2,
    "react/no-find-dom-node": 2,
    "react/no-is-mounted": 2,
    "react/jsx-no-comment-textnodes": 2,
    "react/jsx-curly-spacing": 2,
    "react/jsx-no-undef": 2,
    "react/jsx-uses-react": 2,
    "react/jsx-uses-vars": 2,
    "no-empty": 0,
    "no-console": 0,
    "no-empty-pattern": 0,
    "no-cond-assign": 1,
    "semi": 2,
    "camelcase": 0,
    "comma-style": 2,
    "comma-dangle": [2, "never"],
    "indent": [2, "tab", {"SwitchCase": 1}],
    "no-trailing-spaces": [2, { "skipBlankLines": true }],
    "max-nested-callbacks": [2, 3],
    "no-eval": 2,
    "no-implied-eval": 2,
    "no-new-func": 2,
    "guard-for-in": 2,
    "eqeqeq": 1,
    "no-else-return": 2,
    "no-redeclare": 2,
    "no-dupe-keys": 2,
    "radix": 2,
    "strict": [2, "never"],
    "no-shadow": 0,
    "no-delete-var": 2,
    "no-undef-init": 2,
    "no-shadow-restricted-names": 2,
    "handle-callback-err": 0,
    "no-lonely-if": 2,
    "keyword-spacing": 2,
    "constructor-super": 2,
    "no-this-before-super": 2,
    "no-dupe-class-members": 2,
    "no-const-assign": 2,
    "prefer-spread": 2,
    "no-useless-concat": 2,
    "no-var": 2,
    "object-shorthand": 2,
    "prefer-arrow-callback": 2
  }
};
