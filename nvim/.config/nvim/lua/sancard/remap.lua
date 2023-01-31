-- fix leader
vim.keymap.set({ "n", "v" }, " ", "<Nop>")

-- go back to explore
vim.keymap.set("n", "-", vim.cmd.Ex)

-- exit/escape
vim.keymap.set("i", "jk", "<Esc>")

-- move selected lines up/down and between blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle for searching and jumping between results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste, but keep do not override paste buffer
-- it deletes word and put it into void register and then paste from buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- unify ESC behavior
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Find in system to create new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- ??
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- tabs
vim.keymap.set("v", "<Tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- splits
vim.keymap.set("n", "<leader>pv", ":Vex!<CR>")
