const { spacing } = require('@mui/system')

module.exports = {
  root: true,
  env: {
    node: true,
    es6: true,
    browser: true,
  },
  parser: '@babel/eslint-parser',
  extends: ['next/core-web-vitals', 'prettier'],
  parserOptions: {
    ecmaVersion: 11,
    sourceType: 'module',
    project: './jsconfig.json',
    ecmaFeatures: {
      jsx: true,
      modules: true,
      experimentalObjectRestSpread: true,
    },
  },
  rules: {
    // REACT: Rules
    'react/react-in-jsx-scope': 'off',
    'react/jsx-filename-extension': [
      1, { extensions: ['.js', '.jsx'] },
    ],
    'react/display-name': 'off',
    '@next/next/no-img-element': 'off',
    'react/no-unescaped-entities': 'off',
    'import/no-anonymous-default-export': 'off',

    // ECMASCRIPT: Rules

    'arrow-body-style': ['warn', 'as-needed'],
    'arrow-spacing': 'error',
    'camelcase': 'warn',
    'comma-dangle': ['error', 'always-multiline'],
    'curly': 'error',
    'eqeqeq': 'warn',
    'getter-return': 'error',
    'guard-for-in': 'error',
    'handle-callback-err': 'off',
    'indent': ['error', 2, { SwitchCase: 1 }],
    'key-spacing': 'error',
    'keyword-spacing': 'error',
    'linebreak-style': ['error', 'unix'],
    'lines-between-class-members': ['error', 'always', { exceptAfterSingleLine: true }],
    'no-multiple-empty-lines': ['error', {
      max: 2,
      maxEOF: 1,
      maxBOF: 0,
    }],
    'max-depth': ['error', 4],
    'max-nested-callbacks': ['error', 4],
    'max-statements': ['warn', 20],
    'new-parens': 'error',
    'no-alert': 'off',
    'no-cond-assign': 'warn',
    'no-confusing-arrow': ['error', { allowParens: true }],
    'no-console': 'off',
    'no-const-assign': 'error',
    'no-delete-var': 'error',
    'no-dupe-args': 'error',
    'no-dupe-class-members': 'error',
    'no-dupe-keys': 'error',
    'no-duplicate-case': 'error',
    'no-duplicate-imports': 'error',
    'no-else-return': 'error',
    'no-empty': 'off',
    'no-empty-pattern': 'off',
    'no-eval': 'error',
    'no-extra-semi': 'error',
    'no-implied-eval': 'error',
    'no-irregular-whitespace': 'off',
    'no-lonely-if': 'error',
    'no-new-func': 'error',
    'no-redeclare': 'error',
    'no-shadow': 'off',
    'no-shadow-restricted-names': 'error',
    'no-this-before-super': 'error',
    'no-trailing-spaces': ['error', { skipBlankLines: true }],
    'no-undef-init': 'error',
    'no-unreachable': 'error',
    'no-unused-labels': 'error',
    'no-unused-vars': 'off',
    'no-useless-computed-key': 'error',
    'no-var': 'error',
    'object-curly-spacing': ['error', 'always'],
    'object-shorthand': 'error',
    'one-var-declaration-per-line': 'error',
    'prefer-arrow-callback': 'off',
    'prefer-const': 'error',
    'prefer-spread': 'error',
    'prefer-template': 'warn',
    'quotes': ['error', 'single', { avoidEscape: true }],
    'radix': 'off',
    'semi': ['error', 'never'],
    'no-multi-spaces': 'off',
    'template-curly-spacing': ['error', 'never'],
    'spaced-comment': ['error', 'always', { markers: ['/'] }],
    'strict': ['error', 'never'],

    // Add new line above comment
    'lines-around-comment': [
      'error',
      {
        beforeLineComment: true,
        beforeBlockComment: true,
        allowBlockStart: true,
        allowClassStart: true,
        allowObjectStart: true,
        allowArrayStart: true,
      },
    ],

    // add new line above return
    'newline-before-return': 'error',

    // add new line below import
    'import/newline-after-import': [
      'error', {
        count: 1,
      },
    ],

    // add new line after each var, const, let declaration
    'padding-line-between-statements': [
      'error',
      { blankLine: 'always', prev: ['export'], next: ['*'] },
      { blankLine: 'always', prev: ['*'], next: ['multiline-const', 'multiline-let', 'multiline-var', 'export'] },
    ],
  },
}
