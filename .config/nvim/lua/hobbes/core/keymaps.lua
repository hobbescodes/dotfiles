local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "J", "mxJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- the how it be paste
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- remember yanked
vim.keymap.set("v", "p", '"_dp', opts)

-- Copies or Yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- <C-c> as escape cuz Im lazy to reach up to the esc key, quit insert
vim.keymap.set("i", "<C-c>", "<Esc>", opts)
vim.keymap.set("v", "<C-c>", "<Esc>", opts)
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
-- format using the built in
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open a new tab" }) --open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" }) --close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" }) --go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" }) --go to pre
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current tab in a new tab" }) --open current tab in new tab

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
end, { desc = "Toggle LSP diagnostics" })
