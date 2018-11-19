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
    'plugin:vue/recommended',
    'standard'
  ],
  rules: {
    camelcase: [
      2, { properties: 'always' }
    ],
    eolLast: [2],
    indent: [2, 2],
    keywordSpacing: [2],
    linebreakStyle: [2, 'unix'],
    noUnderscoreDangle: 0,
    noVar: [2],
    quotes: [2, 'single'],
    semi: [2, 'always'],
    // Vue (When Used)
    'vue/max-attributes-per-line': [
      2,
      {
        singleline: 10,
        multiline: {
          max: 10,
          allowFirstLine: true
        }
      }
    ]
  }
}
