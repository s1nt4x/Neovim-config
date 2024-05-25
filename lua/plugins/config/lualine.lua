local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  light    = '#2e303e',
}
local icons = {
    linux = ' ',
    macos = ' ',
    windows = ' ',

    errs = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',

    lsp = ' ',
    git = ''
    --section_separators = {'', ''},
    --component_separators = {'', ''},
}

local function file_osinfo()
  local home_dir = vim.loop.os_homedir()
  local icon
  if home_dir:find('/Users/') then
    icon = icons.macos
    return icon
  elseif home_dir:find('/home/') then
    icon = icons.linux
    return icon 
  else
    icon = icons.windows
    return icon
  end
end

local config = {
  options = {
    component_separators = {left = '', right = ''},
    section_separators = { left = "", right = "" },
    icons_enabled = true,
    theme = tema,
    ignore_focus = {},
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {"branch"},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1, symbols = { modified = "", readonly = " 󰌾 ", unnamed = ""}, color = { fg = "#fff"} },
    },
    lualine_x = {
      { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = { fg = "#ff9e64" } },
    },
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {"tabs"},
    lualine_c = {},
    lualine_x = {{file_osinfo, color = {fg = "#fff"}}},
  },
}


local function lsp_name(component)
  table.insert(config.tabline.lualine_a, component)
end

local function mode_vim(component)
  table.insert(config.sections.lualine_a, component)
end

local function real_time(component)
  table.insert(config.sections.lualine_z, component)
end

local function os_name(component)
  table.insert(config.tabline.lualine_x, component)
end

local function diagnostics_info(component)
  table.insert(config.sections.lualine_y, component)
end

mode_vim {
  "mode",
  fmt = function(str)
    return str
  end,
}

os_name {
  function()
    return vim.loop.os_gethostname()
  end,
  color = {fg = "#fff"}
}

real_time {
  function()
    return "󰥔  " .. os.date("%R")
  end,
}

diagnostics_info {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = icons.errs, warn = icons.warns, info = icons.infos },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}


lsp_name {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return 'LSP Server: '.. client.name
      end
    end
    return msg
  end,
  icon = icons.lsp,
}

return config
