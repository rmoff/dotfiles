-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Aci (Gogh)'
--config.color_scheme = '3024 (dark) (terminal.sexy)'
--config.color_scheme = '3024 (light) (terminal.sexy)'

config.hide_tab_bar_if_only_one_tab = true

config.quit_when_all_windows_are_closed = false

config.font = wezterm.font('Monaspace Argon')
config.font_size=17
config.line_height=1.2
-- config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })

local act = wezterm.action

config.keys = {
 { key = '3', mods = 'OPT', action = wezterm.action.SendString '#' },
  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    }},
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}


config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
--config.default_cursor_style = 'SteadyBlock'
-- config.default_cursor_style = 'BlinkingUnderline'

-- and finally, return the configuration to wezterm
return config

