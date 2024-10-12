require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	--ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "html", "css", "javascript", "java", "python", "sql", "bash", "php" },
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"cpp",
		"html",
		"css",
		"javascript",
		"java",
		"python",
		"sql",
		"bash",
		"php",
		-- "comment", slow on large files of any language
		"diff",
		--"dtd",  supports both xml and dtd files for highlighting?
		"jq",
		"luap", -- not the right name, look at specific usage
		"markdown",
		"markdown_inline",
		"regex",
		"scss",
		--    "svelte",
		"yaml",
		"rust",
		"xml",
	},
	-- DTD and xml parsers are the same i think(?)

	-- Install parsers synchronously (only applied to `ensure_installed`)
	--sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,
	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--    disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
		include_match_words = true,
	},

	-- NOTE: depreciated (see nvim ts autotag plugin)
	-- autotag = {
	-- 	enable = true,
	-- },

	-- indent = {
	--     enable = true
	-- },
})

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]])
