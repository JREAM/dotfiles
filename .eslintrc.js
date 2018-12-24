/**
 * ESLint for JS ECMA Script
 * MIT / Jesse Boyer <JREAM>
 * -----------------------------------
 * @install
    yarn add -D @babel/cli babel-preset-env babel-eslint eslint \
      eslint-plugin-import eslint-config-eslint \
      eslint-config-node eslint-config-promise eslint-plugin-node \
      mocha chai eslint-plugin-chai-expect eslint-plugin-chai-expect

    @ For .babelrc to process ES6+
      yarn add -D babel-preset-env && echo '{"presets": ["env"]}' > .babelrc

    @ If you use the above preset, you can set your packages.json (include .baberc !)
      to use this syntax:
    "scripts": {
      "start": "babel-node file.js"
    }

 */
module.exports = {
  root: true,
  parser: 'babel-eslint',
  env: {
    browser: true,
    node: true,
    es6: true
  },
  plugins: [
    'import',
    'mocha',
    'chai-expect'
  ],
  globals: {
    lodash: true,
    jquery: true,
    moment: true
  },
  parserOptions: {
    sourceType: 'module',
    ecmaVersion: 7,
    ecmaFeatures: {
      impliedStrict: false,
      jsx: false
    }
  },
  extends: [
    'eslint:recommended'
  ],
  rules: {
    'chai-expect/missing-assertion': 2,
    'chai-expect/terminating-properties': 1,
    'mocha/no-exclusive-tests': 2,
    'array-bracket-spacing': [2, 'always'],
    'camelcase': [
      2, { properties: 'always' }
    ],
    'eol-last': [2],
    'indent': [2, 2],
    'keyword-spacing': [2],
    'linebreak-style': [2, 'unix'],
    'no-underscore-dangle': 0,
    'no-var': [2],
    'wrap-iife': [2],
    'prefer-const': [2],
    'quotes': [2, 'single'],
    'semi': [2, 'always'],
  }
}
