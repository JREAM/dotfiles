# ESLint for JS ECMA Script
# MIT / Jesse Boyer <JREAM>
# -----------------------------------
# @install
    yarn add -D @babel/cli babel-preset-env babel-eslint eslint \
      eslint-plugin-import eslint-config-eslint \
      eslint-config-node eslint-config-promise eslint-plugin-node \
      mocha chai eslint-plugin-chai-expect eslint-plugin-chai-expect

    @ For .babelrc to process ES6+
      yarn add -D babel-preset-env && echo '{"presets": ["env"]}' > .babelrc

    @ If you use the above preset, you can set your packages.json (include .baberc !)
      to use this syntax:
    "scripts": {
      "start": "babel-node file.js"
    }

 */
