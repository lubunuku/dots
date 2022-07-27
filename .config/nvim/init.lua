vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
-- vim.opt.cmdheight = 0

require('plugins')

require'nvim-treesitter.configs'.setup {

  -- A list of parser names, or "all"
  ensure_installed = { "python", "c", "lua", "bash", "css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }

}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true, 
    }
}

-- local autosave = require("autosave")
-- autosave.setup(
--     {
--         enabled = true,
--         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
--         events = {"InsertLeave"},
--         conditions = {
--             exists = true,
--             filename_is_not = {},
--             filetype_is_not = {},
--             modifiable = true
--         },
--         write_all_buffers = false,
--         on_off_commands = true,
--         clean_command_line_interval = 0,
--         debounce_delay = 135
--     }
-- )

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = true,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

require'colorizer'.setup()

require("trouble").setup {}

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true
})

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    -- space_char_blankline = " ",
    space_char_blankline = "",
    show_current_context = true,
    show_current_context_start = false,

    --[[ char_list = ['|', '¦', '┆', '┊'],
    char_list_blankline = ['|', '¦', '┆', '┊'], ]]
}

vim.cmd[[let g:indent_blankline_char_list = ['|', '¦', '┆', '┊'] ]]

require('specs').setup{ 
    show_jumps  = false, 
    min_jump = 5,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects 
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = "PMenu",
        fader = require('specs').exp_fader,
        resizer = require('specs').slide_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

require('neoscroll').setup({
    easing_function = "quartic" -- Default easing function
    -- Set any other options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100', nil}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100', nil}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'false', '100', nil}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'false', '100', nil}}
require('neoscroll.config').set_mappings(t)

local actions = require("telescope.actions")
require("telescope").setup{
   mappings = {
      i = {
        ["<C-u>"] = false
      },
    },
  
}

-- require('lualine').setup {
--     options = {
-- 	icons_enabled = "false",
--         theme = "catppuccin",
-- 	component_separators = { left = '', right = ''},
--         section_separators = { left = '', right = ''},
-- 	disabled_filetypes = {},
--      	always_divide_middle = true,
--     	globalstatus = false
--     },
--     sections = {
--     	lualine_a = {'mode'},
--     	lualine_b = {'branch', 'diff', 'diagnostics'},
--    	lualine_c = {'filename'},
--    	lualine_x = {'fileformat', 'filetype'},
--   	lualine_y = {'progress'},
--    	lualine_z = {'location'}
--   },
--   inactive_sections = {
--     	lualine_a = {},
--     	lualine_b = {},
--     	lualine_c = {'filename'},
--     	lualine_x = {'location'},
--     	lualine_y = {},
--     	lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}

-- }

-- vim.g.dashboard_default_executive ='telescope'




local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list = {
  { key = {"<CR>", "o" }, action = "edit", mode = "n"},
  { key = "c", action = "cd" },
  { key = "v", cb = tree_cb("vsplit") }, --tree_cb and the cb property are deprecated
  { key = "s", cb = tree_cb("hsplit") }, --tree_cb and the cb property are deprecated
  { key = "<2-RightMouse>", action = "" }, -- will remove default cd action
}

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    side = "right",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS



require'mapx'.setup{ global = true }

nmap("j", "gj")
-- nmap("k", "gk")
nmap("J", "5j")
nmap("K", "5k")
nmap("<C-h>", "b")
nmap("<C-l>", "e")

vmap("j", "gj")
vmap("k", "gk")
vmap("J", "5j")
vmap("K", "5k")
vmap("<C-h>", "b")
vmap("<C-l>", "e")

nnoremap("<C-b>", ":NvimTreeToggle<Cr>")
nnoremap("<C-z>", ":undo<Cr>")
nnoremap("U", ":redo<CR>")
nnoremap("<C-r>", ":Telescope oldfiles<Cr>")
nnoremap("<C-_>", ":Telescope current_buffer_fuzzy_find<Cr>")

nnoremap("<C-q>", ":q<Cr>")
vnoremap("<C-q>", ":q<Cr>")

nnoremap("<C-s>", ":w<Cr>")
vnoremap("<C-s>", ":w<Cr>")


vim.api.nvim_create_user_command('Told', 'Telescope oldfiles', {})
vim.api.nvim_create_user_command('Hw', 'HopWord', {})
vim.api.nvim_create_user_command('Hl', 'HopLine', {})
-- :command! -nargs=1 Upper echo toupper(<q-args>)

-- vim.cmd('Upper hello world') -- prints "HELLO WORLD"


-- vmap("i", "xi")

nnoremap("gc", "vgc")

-- local home = os.getenv('HOME')
-- local db = require('dashboard')
-- db.preview_command = 'cat | lolcat -F 0.3'
-- -- db.preview_command = 'cat'
-- db.preview_file_path = home .. '/.config/nvim/ascii.txt'
-- db.preview_file_height = 6
-- db.preview_file_width = 54
-- db.custom_center = {
--     {icon = '  ',
--     desc = 'New file                               ',
--     action =  'new',
--     shortcut = 'none'},
--     {icon = '  ',
--     desc = 'Recent files                            ',
--     action = 'Telescope oldfiles',
--     shortcut = 'C-r'},
--     {icon = '  ',
--     desc ='File Browser                            ',
--     action =  'NvimTreeOpen',
--     shortcut = 'C-b'},
--     {icon = '  ',
--     desc = 'Find  word                             ',
--     action = 'Telescope live_grep',
--     shortcut = 'none'},
--   }


local catppuccin = require("catppuccin")

catppuccin.setup({
transparent_background = true,
term_colors = false,
styles = {
	comments = "italic",
	functions = "bold",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = true,
		transparent_panel = true,
	},
	neotree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	which_key = true,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = true,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = true,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = true,
	hop = true,
	notify = true,
	telekasten = true,
	symbols_outline = true,
}
})

vim.cmd[[colorscheme catppuccin]]
