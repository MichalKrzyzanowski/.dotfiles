function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tb1_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map('i', "<C-j>", "<CR><C-R>=AutoPairsReturn()<CR>")
map('n', "<M-Down>", ":m .+1<CR>")
map('n', "<M-Up>", ":m .-2<CR>")
map('i', "<M-Down>", "<Esc>:m .+1<CR>==gi")
map('i', "<M-Up>", "<Esc>:m .-2<CR>==gi")
map('n', "<M-Right>", ":bnext<CR>")
map('n', "<M-Left>", ":bNext<CR>")
map('i', "<M-Right>", "<Esc>:bnext<CR>==gi")
map('i', "<M-Left>", "<Esc>:bNext<CR>==gi")
map('n', "<M-w>", ":Bdelete<CR>")
map('v', "<M-w>", ":Bdelete<CR>")
