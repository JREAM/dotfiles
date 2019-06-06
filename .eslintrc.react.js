module.exports = {
  env: {
    browser: true,
    node: true,
    jest: true
  },
  /**
   * yarn add -D eslint-config-eslint eslint-config-react
   */
  extends: ['eslint:recommended', 'plugin:react/recommended'],
  parser: 'babel-eslint',
  parserOptions: {
    ecmaFeatures: {
      jsx: true
    },
    ecmaVersion: 2018,
    sourceType: 'module'
  },
  'settings': {
    'react': {
      'createClass': 'createReactClass',
      'pragma': 'React',
      'version': 'detect'
    }
  },
  plugins: ['react'],
  rules: {
    'array-bracket-newline': [0, 'never'],
    'array-bracket-spacing': [2, 'always'],
    'array-element-newline': 0,
    'arrow-parens': [2, 'always'],
    'brace-style': [2, '1tbs', {allowSingleLine: true}],
    'comma-dangle': [2, 'only-multiline', {functions: 'never'}],
    'keyword-spacing': [2],
    'linebreak-style': [2, 'unix'],
    'no-console': 0,
    'no-unused-vars': 0,
    'object-property-newline': [2, {allowAllPropertiesOnSameLine: true}],
    'padded-blocks': [2, {'classes': 'always'}],
    'quotes': [2, 'single'],
    'react/button-has-type': [0, {
        'button': false,
        'reset': false,
        'submit': false
      }
    ],
    'react/destructuring-assignment': 0,
    'react/jsx-equals-spacing': [2, 'never'],
    'react/jsx-handler-names': [2, {
        'eventHandlerPrefix': 'on',
        'eventHandlerPropPrefix': 'handle'
      }
    ],
    'react/jsx-indent': [2, 2],
    'react/jsx-indent-props': [2, 2],
    'react/jsx-no-bind': [2, {
        'allowArrowFunctions': true,
        'allowBind': false,
        'allowFunctions': false,
        'ignoreDOMComponents': false,
        'ignoreRefs': false
      }
    ],
    'react/jsx-no-duplicate-props': [2, {ignoreCase: false}],
    'react/jsx-pascal-case': [2, {allowAllCaps: false}],
    'react/jsx-sort-props': [0, {
        callbacksLast: false,
        ignoreCase: true,
        noSortAlphabetically: false,
        shorthandFirst: false,
        shorthandLast: true
      }
    ],
    'react/jsx-uses-react': 2,
    'react/jsx-uses-vars': 1,
    'react/no-multi-comp': [2, {ignoreStateless: true }],
    'react/no-typos': 1,
    'react/prefer-es6-class': [2, 'always'],
    'react/require-render-return': [2],
    'semi': [1, 'always', { omitLastInOneLineBlock: true }],
    'wrap-iife': [2]
  }
}
