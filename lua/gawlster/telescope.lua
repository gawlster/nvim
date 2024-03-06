local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    theme = "center",
    sorting_strategy = "ascending",
    layout_config = {
      width = 0.999,
      height = 0.999,
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
      },
    },

    file_ignore_patterns = {
      "node_modules",
    },

    mappings = {
      i = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-u>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<CR>"] = actions.select_default,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
      n = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-u>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,
        ["q"] = actions.close,

        ["<CR>"] = actions.select_default,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  },
})

require("telescope").load_extension("ui-select")
