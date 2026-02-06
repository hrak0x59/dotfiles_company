-- WezTerm 設定（cyberdream テーマ）
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- 言語・ロケールを日本語に
config.set_environment_variables = {
  LANG = "ja_JP.UTF-8",
  LC_ALL = "ja_JP.UTF-8",
}

-- cyberdream カラーテーマ（Neovim の cyberdream.nvim と統一）
config.colors = dofile(wezterm.config_dir .. "/cyberdream.lua")

-- 背景を Neovim と同じく不透明に（cyberdream の #16181a がそのまま見える）
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- フォント・ウィンドウは最小限
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true

-- ---------------------------------------------
-- カーソル（キャレット）のサイズ・スタイル・点滅
-- 色は cyberdream.lua の cursor_bg / cursor_fg / cursor_border で変更
-- ---------------------------------------------
-- スタイル: SteadyBlock | BlinkingBlock | SteadyBar | BlinkingBar | SteadyUnderline | BlinkingUnderline
config.default_cursor_style = "SteadyBlock"
-- 点滅間隔（ミリ秒）。Blinking* のときのみ有効。0 で点滅オフ
config.cursor_blink_rate = 800
-- Bar/Underline の太さ（Block には効かない）。例: "2px", "0.15cell", "150%"
config.cursor_thickness = "0.15cell"

-- ---------------------------------------------
-- キーバインド（タブ・ペイン）
-- ペイン作成は ⌘+Shift+k/l のみ（横・縦）、ペイン移動は ⌘+jkli
-- ---------------------------------------------
config.keys = {
  -- ペイン作成（⌘+Shift+i = 横分割、⌘+Shift+l = 縦分割）
  { key = "i", mods = "SUPER|SHIFT", action = act.SplitPane { direction = "Down" } },   -- 横（下に分割）
  { key = "l", mods = "SUPER|SHIFT", action = act.SplitPane { direction = "Right" } },  -- 縦（右に分割）
  -- ペイン移動（⌘+jkli）
  { key = "j", mods = "SUPER", action = act.ActivatePaneDirection "Left" },
  { key = "l", mods = "SUPER", action = act.ActivatePaneDirection "Right" },
  { key = "i", mods = "SUPER", action = act.ActivatePaneDirection "Up" },
  { key = "k", mods = "SUPER", action = act.ActivatePaneDirection "Down" },
  -- ペインを閉じる（Option+w）
  { key = "w", mods = "ALT", action = act.CloseCurrentPane { confirm = true } },
  -- ペインズーム（最大化/戻す）option+Z
  { key = "z", mods = "ALT", action = act.TogglePaneZoomState },
  -- ペイン幅・高さの調整（Option+jkli）
  { key = "j", mods = "ALT", action = act.AdjustPaneSize { "Left", 1 } },
  { key = "k", mods = "ALT", action = act.AdjustPaneSize { "Down", 1 } },
  { key = "l", mods = "ALT", action = act.AdjustPaneSize { "Right", 1 } },
  { key = "i", mods = "ALT", action = act.AdjustPaneSize { "Up", 1 } },
}

return config
