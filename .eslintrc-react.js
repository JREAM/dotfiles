/**
 * This is for React Projects
 * Make sure to install the following to your project:
 * @Required
 -----------------------------------------------------
 yarn add -D eslint eslint-config-{airbnb,prettier} \
 eslint-plugin-{import,jsx-a11y,react,flowtype}
 * If you want to use flow for Type Checking:
 * @Optional
 -----------------------------------------------------
   npm i -g flow-bin \
   && yarn add -D flow-bin babel-cli babel-preset-flow \
   && echo '{"presets": ["flow"]}' > .babelrc \
   && yarn flow init && echo "It's common to have an empty .flowconfig"
   && yarn flow status
  @docs: https://flow.org/en/docs/lang/types-and-expressions/
  @examples: https://github.com/raquo/facebook-flow-examples
*/
module.exports = {
  parser: 'espree',
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: 'script',
    ecmaFeatures: {
      experimentalObjectRestSpread: true,
    },
  },
  extends: [
    'prettier',
    'airbnb',
  ],
  plugins: [
    'import',
    'jsx-a11y',
    'react',
  ],
  globals: {
    graphql: true,
  },
  rules: {
    'array-bracket-spacing': [
      2,
      'always',
    ],
    'arrow-body-style': [
      'error',
      'as-needed',
      {
        requireReturnForObjectLiteral: true,
      },
    ],
    'arrow-parens': [
      'error',
      'always',
    ],
    'comma-dangle': [
      'error',
      'always',
    ],
    'eol-last': [
      2,
    ],
    indent: [
      2,
      2,
    ],
    'linebreak-style': [
      2,
      'unix',
    ],
    'no-underscore-dangle': 0,
    'no-var': [
      2,
    ],
    quotes: [
      2,
      'single',
    ],
    'wrap-iife': [
      2,
    ],
    'prefer-const': [
      2,
    ],
    'function-paren-newline': 'off',
    'no-console': 'off',
    'prefer-destructuring': 'off',
    semi: [
      'error',
      'always',
    ],
    'import/extensions': 'off',
    'import/no-extraneous-dependencies': 'off',
    'jsx-a11y/anchor-is-valid': 'off',
    'react/jsx-filename-extension': 'off',
    'react/prefer-stateless-function': 'off',
    'react/prop-types': 'off',
  },
};
