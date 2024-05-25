local version = vim.version()
local function get_color(name, attr)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  if hl[attr] then
    return string.format("#%06x", hl[attr])
  else
    return nil
  end
end

local header_color = get_color('Title', 'foreground')
local center_color = get_color('String', 'foreground')
local footer_color = get_color('Comment', 'foreground')

local logo =
[[
 ::::::::    :::   ::::    ::: ::::::::::: :::    :::    ::: 
:+:    :+: :+:+:   :+:+:   :+:     :+:    :+:     :+:    :+: 
+:+          +:+   :+:+:+  +:+     +:+   +:+ +:+   +:+  +:+  
+#++:++#++   +#+   +#+ +:+ +#+     +#+  +#+  +:+    +#++:+   
       +#+   +#+   +#+  +#+#+#     +#+ +#+#+#+#+#+ +#+  +#+  
#+#    #+#   #+#   #+#   #+#+#     #+#       #+#  #+#    #+# 
 ########  ####### ###    ####     ###       ###  ###    ### 
...  /s1nt4x ...
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

local opts = {
  theme = 'doom',
  config = {
    header = vim.split(logo, "\n"),
    center = {
      {
        icon = ' ',
        desc = ' Find File',
        key = 'f',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = ' New File',
        key = 'n',
        action = 'ene | startinsert'
      },
      {
        icon = ' ',
        desc = ' Recent File',
        key = 'r',
        action = 'Telescope oldfiles'
      },
      {
        icon = ' ',
        desc = ' Quit',
        key = 'q',
        action = 'qa'
      },
    },
    footer = {'N E O V I M -v'.. version.major .. "." .. version.minor}
  }
}

vim.api.nvim_set_hl(0, 'DashboardHeader', {fg = header_color}) 
vim.api.nvim_set_hl(0, 'DashboardCenter', {fg = center_color})
vim.api.nvim_set_hl(0, 'DashboardFooter', {fg = footer_color})

for i, line in ipairs(opts.config.header) do
  vim.api.nvim_buf_add_highlight(0, -1, 'DashboardHeader', i - 1, 0, -1)
end

for _, button in ipairs(opts.config.center) do
  button.desc_hl = 'DashboardCenter'
  button.icon_hl = 'DashboardCenter'
  button.key_hl  = 'DashboardCenter'
  button.desc = button.desc .. string.rep(" ", 16 - #button.desc)
end

return opts
