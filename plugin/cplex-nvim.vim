" Title:        cplex-nvim
" Description:  A plugin to run cplex configuration using commands in Neovim
" Last Change:  8 November 2021
" Maintainer:   Luci-4 <https://github.com/Luci-4>

if exists("g:loaded_cplexnvim")
    finish
endif
let g:loaded_cplexnvim = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/cplex-nvim/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

let cplex_nvim = vim.lua.require('cplex-nvim')
command! -nargs=0 RunConfiguration lua cplex_nvim.run_configuration()
" command! -nargs=0 RunModel lua require("cplex-nvim").run_model()
