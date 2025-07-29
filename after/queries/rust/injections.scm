

(
  macro_invocation
    macro: (identifier) @macro_name (#eq? @macro_name "view")
    (token_tree) @html_content
)
; inject as html
; explicitly tell Treesitter that the node is html
@html_content
  (#set! injection.language "html")
  (#set! injection.include-children true)
