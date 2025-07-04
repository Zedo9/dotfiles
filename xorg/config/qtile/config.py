from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen,Match,Rule
from libqtile.lazy import lazy

# import os
# import subprocess
# @hook.subscribe.startup
# def autostart():
#     home = os.path.expanduser('/home/zedo/.config/qtile/autostart.sh')
#     subprocess.call([home])

mod = "mod4"


keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.up(),desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.down(),desc="Move focus up in stack pane"),
    
    
    # Dmenu
	Key([mod],"p",lazy.spawn("rofi -show run"),desc='Dmenu Run Launcher'),
	
	# Screen Navigation
	Key([mod], "Right",lazy.next_screen(),
		desc='Move focus to next monitor'),
    Key([mod], "Left",lazy.prev_screen(),
        desc='Move focus to prev monitor'),
	
	# Groups Navigation
	Key([mod], "Up",lazy.screen.next_group(),
		desc='Move focus to next group'),
    Key([mod], "Down",lazy.screen.prev_group(),
        desc='Move focus to prev group'),
	
	# Resizing Windows
	Key([mod], "h",lazy.layout.grow(),lazy.layout.increase_nmaster(),
		desc='Expand window (MonadTall), increase number in master pane (Tile)'),
    Key([mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
	Key([mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),

	# Floating and fullscreen 
	Key([mod], "y",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         Key([mod], "m",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),

	Key([mod], "b", lazy.hide_show_bar()),
    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Launch firefox"),
    Key([mod], "f", lazy.spawn("pcmanfm"), desc="Launch pcmanfm"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile")
    # Key([mod], "r", lazy.spawncmd(),desc="Spawn a command using a prompt widget")
]

groups = [Group(i) for i in ["ampersand","eacute", "quotedbl","apostrophe","parenleft","minus","egrave","underscore","ccedilla"]]
groups[0].label = "1"
groups[1].label = "2"
groups[2].label = "3"
groups[3].label = "4"
groups[4].label = "5"
groups[5].label = "6"
groups[6].label = "7"
groups[7].label = "8"
groups[8].label = "9"

for i in groups:
	
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.MonadTall(),
    layout.MonadWide(),
    layout.Max(),
	layout.Floating(),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='fira code bold',
    fontsize=10,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.GroupBox(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.WindowName(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
				widget.CPU(),
				widget.ThermalSensor(),
				widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
				widget.Memory(),
				widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
				# widget.CapsNumLockIndicator(),
				# widget.Backlight(backlight_name='intel_backlight'),                
				# widget.QuickExit(),
                widget.Battery(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                # widget.PulseVolume(),
                widget.Net(interface='wlp3s0', format='{down} ↓ {up} ↑'),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                # widget.Volume(),
                widget.Systray(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.KeyboardLayout(update_interval=1, configured_keyboards=['fr','ar']),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.Clock(format='%I:%M %p %a %d/%m/%Y'),
                # widget.Notify(),
            ],
            20,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.GroupBox(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.WindowName(),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                 
                ),
                widget.Clock(format='%I:%M %p %a %d/%m/%Y'),
            ],
            20,
        ))
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
	Match(wm_type="dialog"),
	Match(wm_type="confirm"),
	Match(wm_type="download"),
	Match(wm_type="error"),
	Match(wm_type="file_progress"),
	Match(wm_class="discord"),
	Match(wm_class="Steam"),
	Match(wm_class="melordi.Melordi"),
	Match(wm_class="Main.Main"),
	Match(wm_class="sample.Main"),
	Match(title="Hello World")
])


# rules = Rule([Match(wm_class="discord"),], group=1, float=True, intrusive=True, break_on_match=False)

"""{'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
"""
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
