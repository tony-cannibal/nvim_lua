-- local cmp = require("cmp")
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmpauto_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmpauto_ok then
	return
end

local cmp_action = require("lsp-zero").cmp_action()

local border_opts = {
	border = "single",
	winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
	-- enabled = true,
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered({
			max_height = 15,
			max_width = 60,
			border = "single",
			col_offset = 0,
			side_padding = 1,
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
			zindex = 1001,
		}),
	},
	completeopt = "menu,preview,menuone,noselect",
	preselect = cmp.PreselectMode.None,
	-- completeopt = "menu,menuone,noselect,noinsert",
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp_action.tab_complete(),
		["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
})
