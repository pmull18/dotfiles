local wezterm = require "wezterm"

local config = {}

config.font_size = 12.0
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
	
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

if wezterm.target_triple:find("windows") then
	config.default_prog = { "wsl.exe", "--exec", "zsh", "l" }
	config.default_domain = "WSL:Ubuntu"
end

return config
