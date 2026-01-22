--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	local darkPurp = hsl(276, 17, 37) -- comment
	local darkPurp2 = hsl(275, 24, 54) -- keyword
	local darkPurp3 = hsl(263, 47, 60)
	local medPurp = hsl(274, 100, 67) --constant
	local lightPurp = hsl(275, 46, 87) --function arg
	local lightPink = hsl(305, 78, 83) --string
	local medPink = hsl(305, 85, 65) -- number
	local medBlue = hsl(243, 90, 80) -- int bool char (type)
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		--colors:
		--  dark blue = 229, 78,13
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		--Cursor         {fg = hsl(340, 90, 80) }, -- Character under the cursor
		--CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		--CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- Directory      { }, -- Directory names (and other special names in listings)
		--DiffAdd({ fg = hsl(340, 90, 80), bg = hsl(0, 100, 100) }), -- Diff mode: Added line |diff.txt|
		--DiffChange({}),                                      -- Diff mode: Changed line |diff.txt|
		--DiffDelete({}), -- Diff mode: Deleted line |diff.txt|
		--DiffText({}), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = hsl(340, 90, 80) }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ fg = hsl(0, 100, 100) }), -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		SignColumn({ bg = "None" }), -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr({ fg = lightPink }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = lightPink }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = lightPink }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ fg = medBlue }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ fg = lightPink }), -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = "None", fg = lightPurp }), -- Normal text
		NormalFloat({ bg = "None", fg = lightPurp }), -- Normal text in floating windows.
		CursorLine({ bg = Normal.fg.darken(80) }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = hsl(47, 100, 79), fg = hsl(0, 0, 20) }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ bg = "None", fg = hsl(0, 100, 100) }), -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		Visual({ bg = medBlue.darken(10), fg = hsl(60, 100, 90) }), -- Visual mode selection
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg     { }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ gui = "italic", fg = darkPurp }), -- Any comment

		Constant({ fg = medPurp }), -- (*) Any constant
		String({ fg = lightPink }), --   A string constant: "this is a string"
		Character({ fg = medPurp }), --   A character constant: 'c', '\n'
		Number({ fg = medPink }), --   A number constant: 234, 0xff
		Boolean({ fg = medPurp }), --   A boolean constant: TRUE, false
		Float({ fg = medPink }), --   A floating point constant: 2.3e10

		Identifier({ fg = lightPurp }), -- (*) Any variable name
		Function({ fg = lightPink }), --   Function name (also: methods for classes)

		Statement({ fg = darkPurp2 }), -- (*) Any statement
		Conditional({ fg = darkPurp2 }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = darkPurp2 }), --   for, do, while, etc.
		Label({ fg = darkPurp2 }), --   case, default, etc.
		Operator({ fg = medPurp }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = darkPurp2 }), --   any other keyword
		Exception({ fg = darkPurp2 }), --   try, catch, throw

		PreProc({ fg = darkPurp2 }), -- (*) Generic Preprocessor
		Include({ fg = darkPurp2 }), --   Preprocessor #include
		Define({ fg = darkPurp2 }), --   Preprocessor #define
		Macro({ fg = darkPurp2 }), --   Same as Define
		PreCondit({ fg = darkPurp2 }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = medBlue }), -- (*) int, long, char, etc.
		StorageClass({ fg = darkPurp2 }), --   static, register, volatile, etc.
		Structure({ fg = darkPurp2 }), --   struct, union, enum, etc.
		Typedef({ fg = darkPurp2 }), --   A typedef

		Special({}), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		Tag({ fg = medBlue }), --   You can use CTRL-] on this
		--Delimiter      {fg = hsl(238, 45, 84) }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--

		DiagnosticInfo({ fg = hsl(180, 77, 73) }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = hsl(204, 100, 81) }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = hsl(132, 65, 80) }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = hsl(60, 80, 50) }),
		DiagnosticError({ fg = hsl(6, 100, 50) }),
		DiagnosticVirtualTextError({ fg = hsl(6, 100, 50) }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = hsl(60, 80, 50) }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = hsl(180, 77, 73) }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = hsl(204, 100, 81) }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ fg = hsl(132, 65, 80) }), -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError({ fg = hsl(0, 100, 50) }), -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ fg = hsl(6, 100, 50) }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ fg = hsl(60, 80, 50) }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ fg = hsl(180, 77, 73) }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ fg = hsl(204, 100, 81) }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ fg = hsl(132, 65, 80) }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = hsl(6, 100, 50) }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ fg = hsl(60, 80, 50) }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ fg = hsl(180, 77, 73) }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ fg = hsl(204, 100, 81) }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ fg = hsl(132, 65, 80) }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		--identifiers
		sym("@variable")({ fg = hsl(0, 0, 100).darken(12) }), -- various variable names
		sym("@variable.builtin")({ fg = hsl(0, 0, 100).darken(12) }), -- vuiltin variable names
		sym("@variable.parameter")({ fg = hsl(0, 0, 100).darken(12) }), -- parameters of a function
		sym("@variable.parameter.builtin")({ fg = hsl(0, 0, 100).darken(12) }), -- special parameters eg _, it
		sym("@variable.member")({ fg = hsl(0, 0, 100).darken(12) }), -- object and struct fields

		sym("@constant")({ fg = medPurp }), -- constant identifiers
		sym("@constant.builtin")({ fg = medPurp }), -- built in constant values
		sym("@constant.macro")({ fg = medPurp }), -- constants defined by the preprocessor

		--sym("@module")({}), --modules or namespaces
		--sym("@module.builtin")({}), -- built-in modules or namespaces
		--sym("@label")({fg = medPurp}), -- GOTO and other labels (e.g. 'label:' in C)

		--Literals
		sym("@string")({ fg = lightPink }), -- String
		-- sym("@string.documentation")({ fg = lightPink }), -- string documenting code eg python docstrings
		-- sym("@string.regexp")({ fg = lightPink }), -- regular expressions
		-- sym("@string.escape")     { }, -- escape sequences
		-- sym("@string.special")    { }, -- other special strings eg. dates
		-- sym("@string.special.symbol")({ fg = lightPink }), -- sybols or atoms
		-- sym("@string.special.url")({ fg = lightPink }), -- URLIs eg hyperlinks (url outside markup)
		-- sym("@string.special.path")({ fg = lightPink }), -- fiilenames

		sym("@character")({ fg = lightPurp }), -- character literals
		-- sym("@character.special") { }, -- special characters eg wildcards

		sym("@boolean")({ fg = medPurp }), -- bool literals
		sym("@number")({ fg = medPink }), -- numeric literals
		sym("@float")({ fg = medPink }), -- float literals

		--types
		sym("@type")({ Type }), -- type or class definitions and annotations
		sym("@type.definition")({ fg = medPurp }), -- built-in types
		sym("@type.builtin")({ fg = medBlue }), -- ids in type definitions eg. typedef <type> <identifier> in c

		-- sym("@attribute")({}) -- attribute annotations eg. python decorators
		-- sym("@attribute.builtin")({}) -- builtin annotations eg @property in python
		-- sym("@property")({}) -- the key in key/value pairs

		sym("@function")({ fg = lightPink }), -- function definitions
		sym("@function.builtin")({ fg = darkPurp3 }), -- built in functions
		sym("@function.call")({ fg = darkPurp3 }), -- function calls
		sym("@function.macro")({ fg = darkPurp2 }), -- preprocessor macros

		sym("@operator")({ fg = medPurp }), -- operators
		-- sym"@constructor"       { }, -- constructor calls and definitions

		-- Keywords
		sym("@keyword")({ fg = darkPurp2 }), -- keywords not fitting into a specific category
		sym("@keyword.coroutine")({ fg = darkPurp2 }), -- keywords related to coroutines (eg async in python)
		sym("@keyword.function")({ fg = darkPurp2 }), -- keywords that define a function eg def in python
		sym("@keyword.operator")({ fg = darkPurp }), -- operators that are english words eg and in python
		sym("@keyword.import")({ Include }), -- keywords for including modules eg from in python
		sym("@keyword.type")({ fg = darkPurp2 }), -- keywords describing composite types eg struct or enum
		sym("@keyword.modifier")({ fg = darkPurp2 }), -- keywords modifying other constructs eg const, or static
		sym("@keyword.repeat")({ fg = darkPurp2 }), -- keywords related to loops eg while or for
		sym("@keyword.return")({ fg = darkPurp2 }), -- the return keyword
		-- sym("@keyword.debug")({ fg = darkPurp }), -- keywords related to debugging
		sym("@keyword.exception")({ fg = darkPurp }), -- keywords related to exceptions eg throw

		sym("@keyword.conditional")({ Conditional }), -- keywords related to conditionals eg if or else
		sym("@keyword.conditional.ternary")({ sym("@operator") }), -- ternary operator eg ? or :

		sym("@keyword.directive")({ fg = darkPurp }), -- various preprocessor directives
		sym("@keyword.directive.define")({ sym("@keyword.directive") }), -- preprocessor definition directives

		-- punctuation
		sym("@punctuation.delimiter")({ Normal }), -- delimiters eg ;
		sym("@punctuation.bracket")({ Normal }), -- brackets eg ()
		sym("@punctuation.special")({ Normal }), -- special symbols eg {} in string interpolation

		-- comments
		sym("@comment")({ gui = "italic", fg = darkPurp }), -- line and block comments
		sym("@comment.documentation")({ gui = "italic", fg = darkPurp }), -- comments documenting code

		sym("@comment.error")({ DiagnosticError }), -- line and block comments
		sym("@comment.warning")({ DiagnosticWarn }), -- line and block comments
		sym("@comment.hint")({ DiagnosticHint }), -- line and block comments
		sym("@comment.info")({ DiagnosticInfo }), -- line and block comments
		-- sym("@comment.todo")({}), -- line and block comments
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
