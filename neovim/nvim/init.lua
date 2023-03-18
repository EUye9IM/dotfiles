-- FIX: E5108: Error executing lua /usr/share/nvim/runtime/lua/vim/lsp/util.lua:385: offset_encoding: expected string, got nil
offset_encoding = 'utf-16'

require("user/options")
require("user/plugins")
require("user/clipboard")
require("user/comp-setup")

