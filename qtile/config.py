###########################################################################
###                         qtile @ discordia - 2021                    ###
###########################################################################

import os
import re
import socket
import subprocess
from qtilecolors import colors
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"

keys = [
    ## KEY_START
    Key([mod], "1", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod], "2", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod], "3", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod], "4", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod], "5", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod], "6", lazy.group[""].toscreen(), desc=" ... Switch to group "),
    Key([mod, "shift"], "1", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod, "shift"], "2", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod, "shift"], "3", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod, "shift"], "4", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod, "shift"], "5", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod, "shift"], "6", lazy.window.togroup(""), desc=" ... Move to group "),
    Key([mod], "a", lazy.next_screen(), desc=' ... Move focus to other monitor'),
    Key([mod], "Left", lazy.layout.left(), desc=' ... Move focus to left'),
    Key([mod], "Right", lazy.layout.right(), desc=' ... Move focus to right'),
    Key([mod], "Down", lazy.layout.down(), desc=' ... Move focus down'),
    Key([mod], "Up", lazy.layout.up(), desc=' ... Move focus up'),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc=' ... Move window to the left'),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc=' ... Move window to the right'),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc=' ... Move window down'),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc=' ... Move window up'),
    Key([mod], "z", lazy.window.toggle_minimize(), desc=' ... Minimise window'),
    Key([mod], "s", lazy.window.toggle_floating(), desc=' ... Toggle floating'),
    Key([mod, "control"], "Up", lazy.layout.grow(), desc=' ... Grow window'),
    Key([mod, "control"], "Down", lazy.layout.shrink(), desc=' ... Shrink window'),
    Key([mod], "x", lazy.window.kill(), desc=' ... Kill focused window'),
    Key([mod], "b", lazy.hide_show_bar(position='all'), desc=' ... Toggle bars'),
    Key([mod], "Pause", lazy.spawn("dpower"), desc=' ... Power Menu'),
    Key([mod, "control"], "r", lazy.restart(), desc=' ... Restart Qtile'),
    Key([mod, "control"], "q", lazy.shutdown(), desc=' ... Shutdown Qtile'),
    Key([mod], "d", lazy.spawn("menu"), desc=' ... Main menu'),
    Key([mod, "shift"], "d", lazy.spawn("run_menu"), desc=' ... Run menu'),
    Key([mod], "c", lazy.spawn("dclipmenu"), desc=' ... Clipboard menu'),
    Key([mod], "u", lazy.spawn("walrand"), desc=' ... Random colourscheme'),
    Key([mod], "y", lazy.spawn("yad --no-buttons --image '/home/zero/.config/wpg/current_sample.png'"), desc=' ... Colourscheme'),
    Key([mod], "Print", lazy.spawn("flameshot full -d 5000 -p /mnt/Gog/Pictures/scrots"), desc=' ... Full screenshot'),
    Key([mod], "p", lazy.spawn("flameshot gui -p /mnt/Gog/Temp"), desc=' ... Screenshot'),
    Key([mod], "Return", lazy.spawn(terminal), desc=' ... Terminal'),
    Key([mod], "F1", lazy.spawn("microsoft-edge-beta"), desc=' ... Browser'),
    Key([mod], "F2", lazy.spawn("vscodium"), desc=' ... Text editor'), 
    Key([mod], "F3", lazy.group['scratch'].dropdown_toggle('floaterm'), desc=' ... Scratch term'),
    Key([mod], "j", lazy.group['scratch'].dropdown_toggle('jack'), desc=' ... JACK patchbay'),
    Key([mod], "f", lazy.group['scratch'].dropdown_toggle('fileman'), desc=' ... File manager'),
    Key([mod], "m", lazy.group['scratch'].dropdown_toggle('mail'), desc=' ... Email client'),
    Key([mod], "k", lazy.spawn("/mnt/Gog/Scripts/qtkb.sh"), desc=" ... Key bindings"),
    ## KEY_END
    ]

group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'})
               ]

groups = [
    Group(name, **kwargs) for name, kwargs in group_names
    ]

groups.append(
    ScratchPad("scratch",
        [
        DropDown("floaterm", terminal, on_focus_lost_hide=False, height=0.55, width=0.55, x=0.25, y=0.25, opacity=1),
        DropDown("jack", "carla-jack-single", on_focus_lost_hide=False, height=0.55, width=0.55, x=0.25, y=0.25),
        DropDown("fileman", "pcmanfm", on_focus_lost_hide=False, height=0.70, width=0.70, x=0.15, y=0.15),
        DropDown("mail", "thunderbird", on_focus_lost_hide=False, height=0.70, width=0.70, x=0.15, y=0.15),
        ]))

layouts = [
    # layout.Max(),
    layout.MonadTall(
        margin=15, 
        border_width=4, 
        new_client_position = 'top',
        border_focus=colors[2]
        ),
    layout.MonadWide(
        margin=15, 
        border_width=4, 
        new_client_position = 'top',
        border_focus=colors[2]
        ),
    # layout.Columns(),
    layout.Stack(
        margin=15, 
        border_width=4, 
        border_focus=colors[2],
        num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),]
    ]

floating_layout = layout.Floating(
    border_focus = colors[6],
    float_rules = [
    *layout.Floating.default_float_rules,
    
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
    Match(wm_class='Wpg'),
    Match(wm_class='Thunderbird'),
    Match(wm_class='Gedit'),
    Match(wm_class="Pamac-manager"),
    Match(wm_class="Gimp-2.10"),
    ]
    )

widget_defaults = dict(
    font = 'Arimo Nerd Font',
    fontsize = 20,
    padding = 1,
    foreground = colors[0],
    background = colors[6],
    opacity=1.0)

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
                    highlight_color = colors[0],
                    highlight_method = 'line',
                    inactive = colors[0],
                    fontsize = 25,
                    margin_y = 3
                ),
                widget.Spacer(
                    length = bar.STRETCH
                ),
                widget.Net(
                    format = "{down:^7}  {up:^7}",
                    interface = "enp3s0"
                ),
                widget.Spacer(
                    length = bar.STRETCH
                ),
                widget.DF(
                    partition = "/",
                    visible_on_warn = False,
                    format = '🧅 {r:.0f}% ',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/home",
                    visible_on_warn = False,
                    format = '🏠 {r:.0f}% ',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/mnt/Gog",
                    visible_on_warn = False,
                    format = '👹 {r:.0f}% ',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/mnt/Magog",
                    visible_on_warn = False,
                    format = '👹 {r:.0f}% ',
                    warn_space = 10
                ),
                widget.DF(
                    partition = "/mnt/Angel",
                    visible_on_warn = False,
                    format = '👼 {r:.0f}% ',
                    warn_space = 10
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Clock(
                    format='📅  %a %d %b %Y  🕐  %I:%M %p',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(
                        'yad --mouse --skip-taskbar --calendar'
                        )},
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
            ],
            30, margin = [0, 15, 0, 15],
        ),
        bottom=bar.Bar([
            widget.TaskList(
                    borderwidth = 0,
                    fontsize = 17,
                    highlight_method = 'block',
                    title_width_method = 'uniform',
                    padding = 3,
                    icon_size = 24,
                    txt_floating = '🗗 ',
                    txt_minimized = '🗕 ',
                    spacing = 4,
                    border = colors[7],
                    unfocused_border = colors[2]
                ),
        ], 30, margin = [0, 15, 0, 15],),
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
                    highlight_color = colors[0],
                    highlight_method = 'line',
                    inactive = colors[0],
                    fontsize = 25,
                    margin_y = 3
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.Spacer(
                    length = bar.STRETCH),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.CheckUpdates(
                    update_interval = 1800,
                    distro = "Arch_checkupdates",
                    display_format = " {updates}",
                    colour_have_updates = colors[0],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(
                        'gxmessage --file /home/zero/.config/zero/updates.txt'
                        )},
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Memory(
                    format = "💻 {MemPercent:^7}%"
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.CPU(
                    format = '🧠 {load_percent:^7}%'
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 20
                ),
                widget.Clock(
                    format='📅  %a %d %b %Y  🕐  %I:%M %p',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(
                        'yad --mouse --skip-taskbar --calendar'
                        )},
                    ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.Systray(
                    icon_size = 24,
                    padding = 2
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
            ],
            30, margin = [0, 15, 0, 15],
        ),
        bottom=bar.Bar([
            widget.TaskList(
                    borderwidth = 0,
                    fontsize = 17,
                    highlight_method = 'block',
                    title_width_method = 'uniform',
                    padding = 3,
                    icon_size = 24,
                    txt_floating = '🗗 ',
                    txt_minimized = '🗕 ',
                    spacing = 4,
                    border = colors[7],
                    unfocused_border = colors[2]
                ),
        ], 30, margin = [0, 15, 0, 15],),
    ),]
 
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "qtile"
