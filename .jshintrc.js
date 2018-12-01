/* eslint-disable */
/**
* Jesse Boyer <JREAM>
*/
module.exports = {
  // Settings
  "passfail"    : false,  // Stop on first error.
  "maxerr"      : 50,       // Maximum error before stopping.

  // Globals: JSHint will not show errors/warnings
  "browser"   : true,   // Std Vrowser Globals (window, document, etc)
  "node"      : true,
  "rhino"     : false,
  "couch"     : false,
  "wsh"       : true,   // Windows Scripting Host.

  // Common 3rd Party Libraries
  "jquery"        : true,
  "ender"         : true,
  "prototypejs"   : false,
  "mootools"      : false,
  "dojo"          : false,

  // Custom globals.
  "predef": [
    'navigator'
  ],


  // Development.
  "debug"   : false,  // Allow debugger statements e.g. browser breakpoints.
  "devel"   : true,   // Allow developments statements e.g. `console.log();`.


  // ECMAScript 5
  "es5"             : true,
  "strict"          : false,
  "globalstrict"    : false,


  // Custom Config
  "asi": true,   // Tolerate Automatic Semicolon Insertion (no semicolons).
  "bitwise": true,   // Prohibit bitwise operators (&, |, ^, etc.).
  "boss": false,  // Tolerate assignments inside if, for & while. Usually conditions & loops are for comparison, not assignments.
  "curly": true,   // Require {} for every new block or scope.
  "eqeqeq": true,   // Require triple equals i.e. `===`.
  "eqnull": false,  // Tolerate use of `== null`.
  "evil": false,  // Tolerate use of `eval`.
  "expr": false,  // Tolerate `ExpressionStatement` as Programs.
  "forin": false,  // Tolerate `for in` loops without `hasOwnPrototype`.
  "immed": true,   // Require immediate invocations to be wrapped in parens e.g. `( function(){}() );`
  "latedef": true,   // Prohipit variable use before definition.
  "laxbreak": true,   // Tolerate unsafe line breaks e.g. `return [\n] x` without semicolons.
  "loopfunc": false,  // Allow functions to be defined within loops.
  "noarg": true,   // Prohibit use of `arguments.caller` and `arguments.callee`.
  "regexdash": false,  // Tolerate unescaped last dash i.e. `[-...]`.
  "regexp": true,   // Prohibit `.` and `[^...]` in regular expressions.
  "scripturl": true,   // Tolerate script-targeted URLs.
  "shadow": false,  // Allows re-define variables later in code e.g. `var x=1; x=2;`.
  "supernew": false,  // Tolerate `new function () { ... };` and `new Object;`.
  "undef": true,   // Require all non-global variables be declared before they are used.


  // Personal styling preferences.
  "newcap"    : true,   // Require capitalization of all constructor functions e.g. `new F()`.
  "noempty"   : true,   // Prohibit use of empty blocks.
  "nonew"     : true,   // Prohibit use of constructors for side-effects.
  "nomen"     : true,   // Prohibit use of initial or trailing underbars in names.
  "onevar"    : false,  // Allow only one `var` statement per function.
  "plusplus"  : false,  // Prohibit use of `++` & `--`.
  "sub"       : false,  // Tolerate all forms of subscript notation besides dot notation e.g. `dict['key']` instead of `dict.key`.
  "trailing"  : true,   // Prohibit trailing whitespaces.
  "white"     : false,  // Check against strict whitespace and indentation rules.
  "indent"    : 2       // Specify indentation spacing
}

