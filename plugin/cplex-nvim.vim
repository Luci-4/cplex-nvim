" Title:        cplex-nvim
" Description:  A plugin to run cplex configuration using commands in Neovim
" Maintainer:   Luci-4 <https://github.com/Luci-4>

if exists("g:loaded_cplexnvim")
    finish
endif
let g:loaded_cplexnvim = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/cplex-nvim/deps"
let escaped_path = fnameescape(s:lua_rocks_deps_loc . "/lua-?/init.lua")
exe "lua package.path = package.path .. ';" . escaped_path . "'"

command! -nargs=0 RunConfiguration lua require('cplex-nvim').run_configuration()
