local wezterm = require "wezterm"

return {
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	default_prog = { "wsl.exe", "--exec", "zsh", "-l" },
	default_domain = "WSL:Ubuntu",

	font_size = 12.0
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("JetBrainsMonoNerdFont"),
}
