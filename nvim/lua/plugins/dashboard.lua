local icons = EcoVim.icons

vim.g.dashboard_custom_header = { 
[[ __       __  .___________. ___________    __    ____  ___      .______      .______  ]], 
[[|  |     |  | |           ||   ____\   \  /  \  /   / /   \     |   _  \     |   _  \  ]],
[[|  |     |  | `---|  |----`|  |__   \   \/    \/   / /  ^  \    |  |_)  |    |  |_)  | ]],
[[|  |     |  |     |  |     |   __|   \            / /  /_\  \   |      /     |   ___/  ]],
[[|  `----.|  |     |  |     |  |____   \    /\    / /  _____  \  |  |\  \----.|  |      ]],
[[|_______||__|     |__|     |_______|   \__/  \__/ /__/     \__\ | _| `._____|| _|      ]],
[[                                                                                       ]],
}

vim.g.dashboard_session_directory = '~/.config/nvim/sessions'
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = { description = { icons.fileNoBg .. 'Find File          ' }, command = 'Telescope find_files hidden=true' },
  b = { description = { icons.fileCopy .. 'Recents            ' }, command = 'Telescope oldfiles hidden=true' },
  c = { description = { icons.timer .. 'Load Last Session  ' }, command = 'SessionLoad' },
  d = { description = { icons.t .. 'Find Word          ' }, command = 'Telescope live_grep' },
  e = { description = { icons.container .. 'Sync Plugins       ' }, command = 'PackerSync' },
  f = { description = { icons.container .. 'Install Plugins    ' }, command = 'PackerInstall' },
  g = { description = { icons.vim .. 'Settings           ' }, command = 'edit $MYVIMRC' },
  h = { description = { icons.container .. 'Exit               ' }, command = 'exit' },
}
