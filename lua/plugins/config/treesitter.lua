local opts = {
  ensure_installed = {
      "javascript",
      "lua",
      "luadoc",
      "luap",
      "python",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
    },
  highlight = {
    enable = true,
    --use_languagetree = true,
  },

  indent = { enable = true },
  autotag = {
		enable = true,
  },
  context_commentstring = {
        enable = true,
        enable_autocmd = false,
  },
  refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
  },
}

return opts
