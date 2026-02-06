-- cyberdream.nvim: High-contrast, Futuristic & Vibrant Neovim Colorscheme
-- https://github.com/scottmckendry/cyberdream.nvim
return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "default",      -- "default" | "light" | "auto"
      transparent = false,     -- 透過背景
      italic_comments = false,
      -- 必要に応じて extensions や highlights を有効化
    })
  end,
}
