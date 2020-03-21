/* eslint-disable */
/**
 * ESLint File
 * @desc JavaScript, React, and/or Preact Eslint Configuration
 * @author JesseLee Boyus
 * @copyright 2019
 * @license MIT
 *
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━==
 *   Table of Contents
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━==
 *  🠶 ALLOWED FILENAMES
 *  🠶 INSTALL DEPENDENCIES  - NPM/Yarn Install based on Your Project Type
 *    ::JavaScript (Default)
 *    ::React
 *    ::Preact
 * 🠶 PARSER
 *   - If CRA React; Disable Completely
 * 🠶 EXTENDS        - If Preact; Enable Synacore
 * 🠶 PLUGINS        - If CRA React; Enable React
 * 🠶 ENV
 * 🠶 PARSER OPTIONS
 * 🠶 SETTINGS       - If Preact; Enable 'h'
 * 🠶 RULES          - Set Your Preferred Rules
 *   ::Global
 *   ::React        - If React; Enable
 *   ::React-Hooks  - If React; Enable
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━==
 * 🠶 ALLOWED FILENAMES (One only in project Root)
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 *  .eslintrc
 *  .eslintrc.js (Default)
 *  .eslintrc.yml
 *  .eslintrc.yaml
 *
 * @docs
 *  [+] Configuring:  https://eslint.org/docs/user-guide/configuring
 *  [+] Formatters:   https://eslint.org/docs/user-guide/formatters
 *  [+] Integrations: https://eslint.org/docs/user-guide/integrations
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * 🠶 INSTALL DEPENDENCIES
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */

/**
  * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
  * ::JavaScript (Default)
  *  You may comment out anything React/Preact Related
  * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
   yarn add -D \
     babel-eslint \
     eslint \
     eslint-config-eslint \
     eslint-plugin-import \
     typescript
  */

/**
 * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * ::React; CRA (Create-React-App)
 *   Uncomment Anything React Related (Search 'React')
 * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
  yarn add -D \
    eslint \
    eslint-config-{eslint,react} \
    eslint-plugin-{import,react,react-hooks} \
    typescript
 */

/**
 * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * ::Preact
 *   Uncomment Anything React Related (Search 'Preact')
 * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
   yarn add -D eslint
     eslint-config-{eslint,preact} \
     typescript
 */

module.exports = {
  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 PARSER
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @important COMMENT OUT With CRA; Do NOT add NPM 'babel-eslint' (Built-in)
   * @docs https://eslint.org/docs/user-guide/configuring#specifying-parser
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  parser: 'babel-eslint',

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 PARSER OPTIONS
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @docs https://eslint.org/docs/user-guide/configuring#specifying-parser-options
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  parserOptions: {
    ecmaFeatures: {
      modules: true,
      jsx: true // For React and Preact Projects, JSX
    }
  },

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 EXTENDS
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @docs https://eslint.org/docs/user-guide/configuring#using-eslintrecommended
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  extends: [
    'eslint:recommended'
    // 'eslint-config-synacore',  // For Preact Projects
  ],

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 PLUGINS
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @docs https://eslint.org/docs/user-guide/configuring#using-the-configuration-from-a-plugin
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  plugins: [
    'react',      // For React Projects
    'react-hooks' // For React Projects
  ],

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 ENV
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @docs https://eslint.org/docs/user-guide/configuring#specifying-environments
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  env: {
    browser: true,
    es6: true,
    jest: true,
    node: true
  },

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 SETTINGS
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   */
  settings: {
    react: {
      // pragma: 'h',       // [~] Preact Projects
      version: 'detect'
    }
  },

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 GLOBALS
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * @docs https://eslint.org/docs/user-guide/configuring#specifying-globals
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  globals: {},

  /**
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * 🠶 RULES
   * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   * - Customize to your Preference
   * - (Optional) Comment out React if using JavaScript only
   *
   * @docs https://eslint.org/docs/rules/
   * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
  rules: {
    /**
     * ::Global
     * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
    'arrow-parens': 2,
    camelcase: 0,
    'comma-dangle': [2, 'always-multiline'],
    'comma-style': 2,
    'constructor-super': 2,
    eqeqeq: 1,
    'guard-for-in': 2,
    'handle-callback-err': 0,
    indent: [2, 2, { SwitchCase: 1, ignoredNodes: ['TemplateLiteral'] }],
    'keyword-spacing': 2,
    'max-nested-callbacks': [2, 4],
    'no-cond-assign': 1,
    'no-console': 0,
    'no-const-assign': 2,
    'no-delete-var': 2,
    'no-dupe-class-members': 2,
    'no-dupe-keys': 2,
    'no-else-return': 2,
    'no-empty-pattern': 0,
    'no-empty': 0,
    'no-eval': 2,
    'no-implied-eval': 2,
    'no-lonely-if': 2,
    'no-new-func': 2,
    'no-redeclare': 2,
    'no-shadow-restricted-names': 2,
    'no-shadow': 0,
    'no-this-before-super': 2,
    'no-trailing-spaces': [2, { skipBlankLines: true }],
    'no-undef-init': 2,
    'no-useless-concat': 2,
    'no-var': 2,
    'object-shorthand': 2,
    'prefer-arrow-callback': 2,
    'prefer-spread': 2,
    quotes: [2, 'single'],
    radix: 2,
    semi: 2,
    strict: [2, 'never'],

    /**
     * ::React
     * ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
     * @docs
     *  https://github.com/yannickcr/eslint-plugin-react#list-of-supported-rules
     *  https://github.com/yannickcr/eslint-plugin-react#jsx-specific-rules
     * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
    'react/jsx-curly-spacing': 2,
    'react/jsx-no-bind': [2, { ignoreRefs: true }],
    'react/jsx-no-comment-textnodes': 2,
    'react/jsx-no-duplicate-props': 2,
    'react/jsx-no-undef': 2,
    'react/jsx-props-no-multi-spaces': 2,
    'react/jsx-uses-react': 2,
    'react/jsx-uses-vars': 2,
    'react/no-find-dom-node': 2,
    'react/no-is-mounted': 2,
    'react/no-string-refs': 2,
    'react/prefer-es6-class': 2,
    'react/require-render-return': 2,
    'react/self-closing-comp': 2,

    /**
     * ::React-Hooks
     * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― */
    'react-hooks/rules-of-hooks': 2, // Checks rules of Hooks
    'react-hooks/exhaustive-deps': 1 // Checks effect dependencies
  }
};
