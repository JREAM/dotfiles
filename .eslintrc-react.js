/**
 * This is for React Projects
 * Make sure to install the following to your project:
 * @Required
 -----------------------------------------------------
 yarn add -D eslint eslint-config-{airbnb,prettier} \
 eslint-plugin-{import,jsx-a11y,react}

 * If you want to use flow for Type Checking:
 * @Optional
 -----------------------------------------------------
   npm i -g flow-bin \
   && yarn add -D flow-bin babel-cli babel-preset-flow eslint-plugin-flowtype \
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
    sourceType: 'module',
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
    window: true,
    document: true
  },
  rules: {
    'array-bracket-spacing': [2, 'always'],
    'arrow-body-style': [2, 'as-needed',
      {
        requireReturnForObjectLiteral: true,
      },
    ],
    'arrow-parens': [2, 'always',],
    'comma-dangle': [2, 'only-multiline',],
    'eol-last': [2,],
    'function-paren-newline': 0,
    'import/extensions': 0,
    'import/no-extraneous-dependencies': 'off',
    'jsx-a11y/anchor-is-valid': 'off',
    'linebreak-style': [2, 'unix',],
    'no-console': 'off',
    'no-var': [2],
    'no-underscore-dangle': 0,
    'no-var': [2,],
    'prefer-const': [2,],
    'prefer-destructuring': 'off',
    'react/jsx-filename-extension': 'off',
    'react/prefer-stateless-function': 'off',
    'react/prop-types': 'off',
    'wrap-iife': [2,],
    indent: [2, 2,],
    quotes: [2, 'single',],
    semi: ['error', 'always',],
  },
};
