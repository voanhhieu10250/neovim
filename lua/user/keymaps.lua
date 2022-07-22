M = {}
local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Copy from nvim to clipboard
-- (use Shift-Insert or Ctrl-Shift-v for parse text from clipboard to nvim)
keymap("v", "<A-c>", '"+y', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Copy from nvim to clipboard
-- (use Shift-Insert or Ctrl-Shift-v for parse text from clipboard to nvim)
keymap("x", "<A-c>", '"+y', opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })
keymap("n", "<m-v>", "<cmd>vsplit<cr>", opts)
-- keymap("n", "<m-q>", "<cmd>:q<cr>", opts)
-- keymap("n", "<tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	"<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<s-tab>",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
	opts
)
M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
---@diagnostic disable-next-line: missing-parameter
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
---@diagnostic disable-next-line: missing-parameter
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	else
		vim.lsp.buf.hover()
	end
end
keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

return M
