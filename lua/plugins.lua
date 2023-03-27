return {
	-- libraries
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	-- common plugins
	{"nvim-neo-tree/neo-tree.nvim", opts={
		window = {
			mappings = {
				["o"] = "open",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show_by_pattern = {
					"*.pyc",
				},
			},
		},
	}},
	{"nvim-telescope/telescope.nvim", opts={
		defaults = {
			mappings = {
				i = {
					["<cr>"] = function(bufnr) -- switch to existing tab if file already opened
						require("telescope.actions.set").edit(bufnr, "tab drop")
					end
				},
			},
		},
	}},
	"LukasPietzschmann/telescope-tabs", -- Ctrl-T
	-- git
	"tpope/vim-fugitive",
	"kdheepak/lazygit.nvim",
	--"lewis6991/gitsigns.nvim",
	-- colorschemes
	"rktjmp/lush.nvim", -- library for wombat
	"ViViDboarder/wombat.nvim",
	"ellisonleao/gruvbox.nvim",
	"neanias/everforest-nvim",
	"folke/tokyonight.nvim",
}
-- TODO:
-- tagbar
-- Ack / Ag
-- hop
-- coc
-- codeium
