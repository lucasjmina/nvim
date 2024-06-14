# A biologist's Neovim

This setup is mostly used to code in R and write markdown.

```
.
├── after/                  # Everything sourced last
│   └── ftplugin/           # Filetype configurations
├── colors/                 # Everything related to colorshcemes
│   └── nvim_colors.lua     # Color scheme
├── init.lua                # Init file
├── lazy-lock.json          # Lockfile for plugins versions
└── lua                     # Lua code goes here
    ├── autocmds.lua        # Autocommands
    ├── keymaps.lua         # All Keymaps
    ├── plugins/            # Configuration files for plugins
    ├── settings.lua        # General settings
    └── user_cmds.lua       # User defined commands
```

## Dependencies

- [A Nerd Font](https://www.nerdfonts.com)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd (optional)](https://github.com/sharkdp/fd)
- [git](https://git-scm.com/)
