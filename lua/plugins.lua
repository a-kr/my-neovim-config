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
		follow_current_file = true,
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

	-- {"numToStr/Comment.nvim", config=function(_, opts)
	-- 	local K = vim.keymap.set
	-- 	K('n', '<leader>c<space>', '<Plug>(comment_toggle_linewise)', { desc = 'Comment toggle linewise' })
	-- end},
	{"preservim/nerdcommenter"},

	{"phaazon/hop.nvim", opts={}},-- Easymotion-like

	--{
		--"L3MON4D3/LuaSnip",
		---- follow latest release.
		--version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		---- install jsregexp (optional!).
		--build = "make install_jsregexp"
	--},

	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old  
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			--"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				--snippet = {
					--expand = function(args)
						--require("luasnip").lsp_expand(args.body)
					--end,
				--},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-n>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					--{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				-- formatting = {
				-- 	format = function(_, item)
				-- 		local icons = require("lazyvim.config").icons.kinds
				-- 		if icons[item.kind] then
				-- 			item.kind = icons[item.kind] .. item.kind
				-- 		end
				-- 		return item
				-- 	end,
				-- },
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},


	-- "neoclide/coc.nvim",
	{"neovim/nvim-lspconfig",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				"ray-x/lsp_signature.nvim", -- signature as you type
			},
		},
		setup=function()
		end,
		opts = {
			servers = {
				pyright = {},
				rust_analyzer = {},
				gopls = {}, -- go install golang.org/x/tools/gopls@latest
			},
		},
		config = function(_, opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			require'lspconfig'.pyright.setup{
				capabilities = capabilities
			}
			require'lspconfig'.gopls.setup{}
			require'lspconfig'.rust_analyzer.setup{}
			require "lsp_signature".setup({
				hint_prefix = 'ℹ️  ',
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded"
				}
			})
		end,
	},

	{'hedyhli/outline.nvim', opts={
		highlight_hovered_item = false,
		show_guides = true,
		auto_preview = false,
		position = 'right',
		relative_width = true,
		width = 25,
		auto_close = false,
		show_numbers = false,
		show_relative_numbers = false,
		show_symbol_details = true,
		preview_bg_highlight = 'Pmenu',
		autofold_depth = nil,
		auto_unfold_hover = true,
		fold_markers = { '', '' },
		wrap = false,
		keymaps = { -- These keymaps can be a string or a table for multiple keys
			close = {"<Esc>", "q"},
			goto_location = "<Cr>",
			focus_location = "o",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
			fold = "h",
			unfold = "l",
			fold_all = "W",
			unfold_all = "E",
			fold_reset = "R",
		},
		symbol_folding = {
			-- Depth past which nodes will be folded by default. Set to false to unfold all on open.
			     autofold_depth = false,
		},
		symbols = {
			filter = {
				'Variable',
				exclude = true
			}
		},
		lsp_blacklist = {},
		symbol_blacklist = {  -- старая настройка
			-- 'File',
			-- 'Module',
			-- 'Namespace',
			-- 'Package',
			-- 'Class',
			-- 'Method',
			-- 'Property',
			-- 'Field',
			-- 'Constructor',
			-- 'Enum',
			-- 'Interface',
			-- 'Function',
			'Variable',
			-- 'Constant',
			-- 'String',
			-- 'Number',
			-- 'Boolean',
			-- 'Array',
			-- 'Object',
			-- 'Key',
			-- 'Null',
			-- 'EnumMember',
			-- 'Struct',
			-- 'Event',
			-- 'Operator',
			-- 'TypeParameter',
			-- 'Component',
			-- 'Fragment',
		},
	}},

	"mileszs/ack.vim",

	"junegunn/vim-easy-align",

	-- Tabby plugin https://github.com/TabbyML/vim-tabby
	-- https://tabby.tabbyml.com/docs/extensions/installation/vim/
    { 
      "TabbyML/vim-tabby",
      lazy = false,
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      init = function()
        vim.g.tabby_agent_start_command = {"npx", "tabby-agent", "--stdio"}
        --vim.g.tabby_inline_completion_trigger = "auto"
        vim.g.tabby_inline_completion_trigger = "manual"
		vim.g.tabby_inline_completion_keybinding_accept = "<Tab>"
		vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = "<C-\\>"
      end,
    },
	
	-- git
	"tpope/vim-fugitive",
	"kdheepak/lazygit.nvim",
	--"lewis6991/gitsigns.nvim",
	-- colorschemes
	"rktjmp/lush.nvim", -- library for wombat
	{"zaldih/themery.nvim", -- theme switcher. :Themery<CR>
		config = function(_, opts)
			local darkschemes = {
				"solarized",
				"material",
				"terafox",
				"carbonfox",
				"duskfox",
				"nightfox",
				"nordfox",
				"everforest",
				"gruvbox",
				"tokyonight",
				"tokyonight-moon",
				"tokyonight-storm",
				"blue",
				"darkblue",
				"evening",
				"lunaperche",
				"slate",
			}
			local lightschemes = {
				"solarized",
				"tokyonight-day",
				"everforest",
				"gruvbox",
				"dawnfox",
				"dayfox",
				"peachpuff",
			}

			local themes = {}

			for _, v in pairs(darkschemes) do
				local t = {
					name = v .. " (dark)",
					colorscheme = v,
					before = [[
						vim.opt.background = "dark"
					]],
				}
				table.insert(themes, t)
			end
			for _, v in pairs(lightschemes) do
				local t = {
					name = v .. " (light)",
					colorscheme = v,
					before = [[
						vim.opt.background = "light"
					]],
				}
				table.insert(themes, t)
			end

			require("themery").setup({
				--themeConfigFile = "~/.config/nvim/lua/themery_persist.lua",
				themes = themes,
			})
		end,
	},
	--"Tsuzat/NeoSolarized.nvim",
	"ViViDboarder/wombat.nvim",
	"ellisonleao/gruvbox.nvim",
	"neanias/everforest-nvim",
	"folke/tokyonight.nvim",
	"shaunsingh/solarized.nvim",
	"EdenEast/nightfox.nvim",
	"marko-cerovac/material.nvim",
}
-- TODO:
-- tagbar
-- codeium
-- https://github.com/inkarkat/vim-mark / https://github.com/t9md/vim-quickhl / ...
