/**
* Jesse Boyer <JREAM>
* @install: VSCode Plugin "Beautifier"
*/
module.exports = {
  eol: "\n",
  tab_size: 2,
  indent_char: " ",
  index_with_tabs: false,
  wrap_line_length: 120,
  wrap_attributes: false,
  unformatted: "wbr",
  indent_inner_html: false,
  preserve_newlines: true,
  max_preserve_newlines: 2,
  indent_handlebars: true,
  end_with_newline: true,
  extra_liners: "p",
  space_in_paren: true,
  beautify.language {
    "js": [
      type: ["javascript", "json"],
      filename: [".jshintrc", ".jsbeautifyrc", ".eslintrc", ".prettier"],
      ext: ["js", "json"]
    ],
    "css": [
      "css", "scss", "sass", "less", "styl"
    ],
    "html": [
      "htm", "html", "twig", "vue", "volt", "blade"
    ]
  },
  beautify.ignore: [
    "**/test.js", "**/spec/*", "**/test/**/*", "**/*_test.js"]
  ]
}
