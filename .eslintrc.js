/**
 * ESLint for JS ECMA Script
 * MIT / Jesse Boyer <JREAM>
 * -----------------------------------
 * @install
    yarn add -D \
    eslint \
    babel-eslint \
    eslint-plugin-import \
    eslint-plugin-node \
    eslint-config-eslint \
    eslint-config-node \
    eslint-config-promise
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
    'import'
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
    'array-bracket-spacing': [2, 'always'],
    'camelcase': [
      2, { properties: 'always' }
    ],
    'eol-last': [2],
    'indent': [2, 2],
    'keyword-spacing': [2],
    'linebreak-style': [2, 'unix'],
    'no-underscore-dangle': 0,
    'no-console': 0,
    'comma-dangle': [2, 'only-multiline'],
    'no-var': [2],
    'wrap-iife': [2],
    'prefer-const': [2],
    'quotes': [2, 'single'],
    'semi': [2, 'always'],
  }
}
