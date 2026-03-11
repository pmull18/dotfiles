local wezterm = require "wezterm"

local config = {}

config.font_size = 12.0,
config.color_scheme = "Catppuccin Mocha",
config.font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	
if wezterm.target_triple:find("windows") then
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.default_prog = { "wsl.exe", "--exec", "zsh", "l" }
	config.default_domain = "WSL:Ubuntu"
else
	config.window_decorations = "RESIZE"
end

return config
