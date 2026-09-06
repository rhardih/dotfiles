-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
--
-- "mac" variant of the us layout reproduces macOS's Option-key behavior:
-- Left Alt+a = å, Left Alt+o = ø, Left Alt+' = æ, and Left Alt+e/u/i/n/`
-- are dead keys for acute/diaeresis/circumflex/tilde/grave (press again,
-- e.g. Left Alt+e then e = é).
--
-- The "mac" variant bakes in level3(ralt_switch) internally, putting the
-- accent trigger on right Alt by default. lv3:lalt_switch moves it to left
-- Alt instead (comfortable as a cross-hand chord with right-side letter
-- keys on a split keyboard), and lv3:ralt_alt undoes the variant's own
-- ralt_switch so right Alt reverts to plain Alt_R/Mod1 - restoring every
-- default Hyprland Alt-based binding (ALT+Tab, SUPER+ALT+n window groups,
-- etc.) via right Alt with no further changes needed.
--
-- Tried giving both Alt keys accent AND normal-Alt duty simultaneously
-- (a custom modifier_map binding both Mod1 and Mod5 to each key) - it
-- genuinely worked at the raw libxkbcommon level (verified directly), but
-- broke both Alt+Tab and accent input in practice, almost certainly
-- because Hyprland's bind matching and/or fcitx5's input-method layer
-- don't tolerate a key carrying two modifier roles at once. Splitting the
-- two roles across the two physical keys is the version that's actually
-- stable.
hl.config({
  input = {
    kb_variant = "mac",
    kb_options = "compose:caps,shift:both_capslock_cancel,lv3:lalt_switch,lv3:ralt_alt",
  },
})
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
