-- local null_ls = require("null-ls")
local nlls_ok, null_ls = pcall(require, "null-ls")
if not nlls_ok then
	return
end

null_ls.setup({
	sources = {
		-- Here you can add tools not supported by mason.nvim
	},
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = {
		"lua-ls",
		"autopep8",
		"pylama",
	},
	automatic_installation = false, -- You can still set this to `true`
	automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()
