{
  "parser": "babel-eslint",
  "extends": [
    "prettier",
    "airbnb"
  ],
  "plugins": [
    "import",
    "jsx-a11y",
    "react"
  ],
  "globals": {
    "graphql": true
  },
  "rules": {
    "array-bracket-spacing": [
      2,
      "always"
    ],
    "arrow-body-style": [
      "error",
      "as-needed",
      {
        "requireReturnForObjectLiteral": true
      }
    ],
    "arrow-parens": [
      "error",
      "always"
    ],
    "comma-dangle": [
      "error",
      "always"
    ],
    "eol-last": [
      2
    ],
    "indent": [
      2,
      2
    ],
    "linebreak-style": [
      2,
      "unix"
    ],
    "no-underscore-dangle": 0,
    "no-var": [
      2
    ],
    "quotes": [
      2,
      "single"
    ],
    "wrap-iife": [
      2
    ],
    "prefer-const": [
      2
    ],
    "function-paren-newline": "off",
    "no-console": "off",
    "prefer-destructuring": "off",
    "semi": [
      "error",
      "always"
    ],
    "import/extensions": "off",
    "import/no-extraneous-dependencies": "off",
    "jsx-a11y/anchor-is-valid": "off",
    "react/jsx-filename-extension": "off",
    "react/prefer-stateless-function": "off",
    "react/prop-types": "off"
  }
}
