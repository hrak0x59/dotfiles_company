-- Lazy.nvim ブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン読み込み
require("lazy").setup("plugins")

-- カラースキーム適用（cyberdream は先に読み込まれる）
vim.cmd("colorscheme cyberdream")

-- ---------------------------------------------
-- 挿入・移動: h=挿入(iの代わり), j=左, k=下, l=右, i=上（WezTerm の ⌘+jkli と揃える）
-- ---------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 移動 j=左, k=下, l=右, i=上
local move_modes = { "n", "v", "o" }
for _, m in ipairs(move_modes) do
  vim.keymap.set(m, "j", "<Left>", { desc = "Left" })
  vim.keymap.set(m, "k", "<Down>", { desc = "Down" })
  vim.keymap.set(m, "l", "<Right>", { desc = "Right" })
  vim.keymap.set(m, "i", "<Up>", { desc = "Up" })
end
-- 挿入: h で i の代わりに挿入モードへ
vim.keymap.set("n", "h", "i", { desc = "Insert" })
vim.keymap.set("n", "H", "I", { desc = "Insert at line start" })
