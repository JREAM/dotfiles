module.exports = {
  plugins: [
    'react'
  ],
  parserOption: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    }
  },
  env: {
    es6: true,
    browser: true,
    node: true,
    mocha: true
  },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended'
  ],
  rules: {
    // first argument: 0 - silent, 1 - warning, 2 - error
    strict: [2, 'safe'],
    noDebugger: 2,
    braceStyle: [2, '1tbs', { allowSingleLine: true }],
    noTrailingSpaces: 2,
    keywordSpacing: 2,
    spaceBeforeFunctionParen: [2, 'never'],
    spacedComment: [2, 'always'],
    varsOnTop: 2,
    noUndef: 2,
    noUndefined: 2,
    commaDangle: [2, 'never'],
    quotes: [2, 'single'],
    semi: [2, 'always'],
    GuardForIn: 2,
    noEval: 2,
    noWith: 2,
    validTypeof: 2,
    noUnusedVars: 2,
    noContinue: 1,
    noExtraSemi: 1,
    noUnreachable: 1,
    noUnusedExpressions: 1,
    noMagicNumbers: 1,
    maxLen: [
      1, 80, 4
    ],
    'react/prefer-es6-class': 1,
  }
}
