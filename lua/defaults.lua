local gitSign = "┃" --"▎""▏""│""┃""║"󱂈"󰇙"
local gitDiff = " "

local diagnosticsSigns = {
  error = " ",
  warn = " ",
  hint = "󰠠 ",
  info = " ",
}

local Palette = {
  bg = "#141E27",
  fg = "#ffffff",
  status_bg = "#333433",
  status_fg = "#95a5a6",
  none = "NONE",
  white = "#ecf0f1",
  yellow = "#f1c40f",
  green = "#2ecc71",
  cyan = "#16a085",
  blue = "#3498db",
  magenta = "#9b59b6",
  red = "#e74c3c",
  orange = "#e67e22",
  grey = "#505050",
}

return {
  color = "ayu", 
  float_border = "rounded", 
  languages = {
    "lua",
    "css",
    "scss",
    "html",
    "vue",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "astro",
    "markdown",
    "markdown_inline",
  },
  colors = {
    pallete = Palette,
  },
  icons = {
    diagnostics = {
      signs = diagnosticsSigns,
      Signs = {
        Error = diagnosticsSigns.error,
        Warn = diagnosticsSigns.warn,
        Hint = diagnosticsSigns.hint,
        Info = diagnosticsSigns.info,
      },
    },
    git = {
      diff = {
        added = gitDiff,
        modified = gitDiff,
        removed = gitDiff,
      },
      signs = {
        add = { text = gitSign },
        change = { text = gitSign },
        delete = { text = gitSign },
        topdelete = { text = gitSign },
        changedelete = { text = gitSign },
        untracked = { text = gitSign },
      },
    },
  },
}
