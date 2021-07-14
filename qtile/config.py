###########################################################################
###                         qtile @ discordia - 2021                    ###
###########################################################################

import os
import re
import socket
import subprocess
from qtilecolors import colors
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"

keys = [

    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "Up", lazy.layout.grow()),
    Key([mod, "control"], "Down", lazy.layout.shrink()),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "d", lazy.spawn("/mnt/Gog/Scripts/menu.sh"), desc="Main menu"),
    Key([mod, "shift"], "d", lazy.spawn("/mnt/Gog/Scripts/run_menu.sh"), desc="Run menu"),
    Key([mod], "c", lazy.spawn("/mnt/Gog/Scripts/clipmenu.sh"), desc="Clipboard menu"),
    Key([mod], "i", lazy.spawn("/mnt/Gog/Scripts/check.sh"), desc="Updates list"),
    Key([mod], "g", lazy.spawn("/mnt/Gog/Scripts/dswitcher.sh"), desc="Window menu"),

    Key([mod], "u", lazy.spawn("/mnt/Gog/Scripts/walrand.sh"), desc="Random colourscheme"),

    Key([mod], "Print", lazy.spawn("flameshot full -d 5000 -p /mnt/Gog/Pictures/scrots"), desc="Full screenshot"),
    Key([mod], "p", lazy.spawn("flameshot gui -p /mnt/Gog/Temp"), desc="Screenshot"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Terminal"),
    Key([mod], "F1", lazy.spawn("vivaldi-stable"), desc="Browser"),
    Key([mod, "shift"], "F1", lazy.spawn("vivaldi-stable --restore-last-session"), desc="Browser session"),
    Key([mod], "F2", lazy.spawn("vscodium"), desc="Text editor"), 

    Key([mod], "F3", lazy.group['scratch'].dropdown_toggle('floaterm'), desc="Scratch term"),
    Key([mod], "j", lazy.group['scratch'].dropdown_toggle('jack'), desc="JACK patchbay"),
    Key([mod], "k", lazy.group['scratch'].dropdown_toggle('fileman'), desc="File manager"),
    Key([mod], "m", lazy.group['scratch'].dropdown_toggle('mail'), desc="Email client"),
]

group_names = [("爵", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

groups.append(
    ScratchPad("scratch", [
        DropDown("floaterm", "alacritty", on_focus_lost_hide=False, height=0.55, width=0.55, x=0.25, y=0.25),
        DropDown("jack", "carla-jack-single", on_focus_lost_hide=False, height=0.55, width=0.55, x=0.25, y=0.25),
        DropDown("fileman", "pcmanfm",  on_focus_lost_hide=False, height=0.70, width=0.70, x=0.15, y=0.15),
        DropDown("mail", "thunderbird",  on_focus_lost_hide=False, height=0.70, width=0.70, x=0.15, y=0.15),
        ])
)

layouts = [
    layout.Max(),
    layout.MonadTall(
        margin=15, 
        border_width=4, 
        border_focus=colors[2]
        ),
    layout.MonadWide(
        margin=15, 
        border_width=4, 
        border_focus=colors[2]
        ),
    # layout.Columns(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='ArimoNerdFont',
    fontsize=20,
    padding=1,
    background=colors[6],
    opacity=1.0
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale = 0.65
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.GroupBox(
                    highlight_color = colors[5],
                    highlight_method = 'line',
                    inactive = colors[5],
                    margin = 1            
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.WindowName(),
                widget.DF(
                    partition = "/",
                    visible_on_warn = False,
                    format = 'r:{r:.0f}%',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/home",
                    visible_on_warn = False,
                    format = 'h:{r:.0f}%',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/mnt/Gog",
                    visible_on_warn = False,
                    format = 'g:{r:.0f}%',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/mnt/Angel",
                    visible_on_warn = False,
                    format = 'a:{r:.0f}%',
                    warn_space = 10
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.CheckUpdates(
                    update_interval = 1800,
                    distro = "Arch_checkupdates",
                    display_format = " {updates} Updates"
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Clock(
                    format='%a %d %b %Y    %I:%M %p'
                ),
            ],
            30,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale = 0.65
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.GroupBox(
                    highlight_color = colors[5],
                    highlight_method = 'line',
                    inactive = colors[5],
                    margin = 1
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.WindowName(),
                widget.Net(
                    format = "↓{down} ↑{up}",
                    interface = "enp3s0"
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Memory(
                    format = " {MemPercent}%"
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.CPU(
                    format = ' {freq_current}G {load_percent}%'
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.Clock(
                    format='%a %d %b %Y    %I:%M %p'
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Systray(
                    icon_size = 24,
                    padding = 2
                ),
            ],
            30,
        ),
    ),
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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Cadence'),
    Match(wm_class='Youtube Downloader'),
    Match(wm_class='Carla2-Single-Client'),
    Match(wm_class='SimpleScreenRecorder'),
    Match(wm_class='Nm-connection-editor'),
    Match(wm_class='Gcolor2'),
    Match(wm_class='Arandr'),
    Match(wm_class='balena-etcher-electron'),
    Match(wm_class='feh'),
    Match(wm_class='Gxmessage'),
    Match(wm_class='Gnome-mplayer'),
    Match(wm_class='Yad'),
    Match(wm_class='PkgBrowser'),
    Match(wm_class='Wpg'),
    Match(wm_class='Thunderbird'),
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "qtile"
