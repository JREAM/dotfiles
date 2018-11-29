/**
 * ESLint (For Standard ECMA Script)
 *
 * @install dependencies
      yarn add -D babel-preset-env babel-eslint eslint \
        eslint-plugin-import eslint-config-eslint

    @install babelrc
      echo '{"presets": ["env"]}' > .babelrc
*/
module.exports = {
  root: true,
  parser: "babel-eslint",
  env: {
    browser: true,
    node: true,
    es6: true
  },
  plugins: ["import"],
  globals: {
    lodash: true,
    jquery: true,
    moment: true
  },
  parserOptions: {
    sourceType: "module",
    ecmaVersion: 7,
    ecmaFeatures: {
      impliedStrict: false,
      jsx: false
    }
  },
  extends: ["eslint:recommended"],
  rules: {
    "array-bracket-spacing": [2, "always"],
    camelcase: [2, { properties: "always" }],
    "eol-last": [2],
    indent: [2, 2],
    "keyword-spacing": [2],
    "linebreak-style": [2, "unix"],
    "no-underscore-dangle": 0,
    "no-var": [2],
    "comma-dangle": [2, "always"],
    "wrap-iife": [2],
    "prefer-const": [2],
    quotes: [2, "single"],
    semi: [2, "always"]
  }
};
