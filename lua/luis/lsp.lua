-- local lsp = require("lsp-zero").preset({})
local lsp_ok, lsp = pcall(require, "lsp-zero")

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
	cmp_capabilities = true,
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
	"lua_ls",
})

lsp.setup_nvim_cmp({
	preselect = "none",
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
})

-- lsp.setup_nvim_cmp({
-- 	documentation = {
-- 		max_height = 15,
-- 		max_width = 60,
-- 		border = "rounded",
-- 		col_offset = 0,
-- 		side_padding = 1,
-- 		winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
-- 		zindex = 1001,
-- 	},
-- 	formatting = {
-- 		fields = { "abbr", "kind", "menu" },
-- 		format = require("lspkind").cmp_format({
-- 			mode = "symbol_text", -- show only symbol annotations
-- 			maxwidth = 50, -- prevent the popup from showing more than provided characters
-- 			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
-- 		}),
-- 	},
-- })

lsp.format_on_save({
	format_opts = {
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua" },
	},
})

lsp.setup()
