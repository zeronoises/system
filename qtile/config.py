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
terminal = "kitty"

keys = [

    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    Key([mod], "F1", lazy.spawn("vivaldi-stable"), desc="Browser"),
    Key([mod], "F2", lazy.spawn("gedit"), desc="Text editor"), 
]

group_names = [("爵", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layouts = [
    # layout.Columns(),
    layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
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
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='ArimoNerdFont',
    fontsize=18,
    padding=3,
    background=colors[6],
    opacity=1.0
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    ),
                widget.WindowName(),
                widget.Prompt(),
                widget.Clock(
                    format='%a %d %b %Y    %I:%M %p'
                    ),
            ],
            26,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    ),
                widget.WindowName(),
                widget.Prompt(),
                widget.Clock(
                    format='%a %d %b %Y    %I:%M %p'
                    ),
                widget.Systray(),
            ],
            26,
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
    Match(wm_class='Floaterm'),
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"

