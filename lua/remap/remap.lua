local telescope = require("telescope").setup({
	defaults = {	
		file_ignore_patterns = {"node%_modules", "target", "bin"}
	}
})

local builtin = require("telescope.builtin")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
