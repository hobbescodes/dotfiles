require("hobbes.core.options")
require("hobbes.core.keymaps")

local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	group = numbertoggle,
	callback = function()
		vim.opt.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
	group = numbertoggle,
	callback = function()
		if vim.opt.number then
			vim.opt.relativenumber = true
		end
	end,
})
