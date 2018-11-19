/**
 * ESLint 5 Lints empty files, ensure
 * a .eslintignore file exists.
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
    'standard'
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
    'no-var': [2],
    'wrap-iife': [2],
    'prefer-const': [2],
    'quotes': [2, 'single'],
    'semi': [2, 'always'],
  }
}
