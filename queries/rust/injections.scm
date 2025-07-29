; Inject HTML inside view! macro
(
  macro_invocation
    macro: (identifier) @macro_name (#eq? @macro_name "view")
    (token_tree) @html_content
  (#set! injection.language "html")
  (#set! injection.include-children)
)
