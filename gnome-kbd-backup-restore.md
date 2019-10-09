
MAKE SURE TO RUN BOTH

These are defaults often, if empty nothing changed.
```sh
# RUN
dconf dump /org/gnome/shell/keybindings/ > dconf-kbd-bkup.txt
dconf load /org/gnome/shell/keybindings/ < dconf-kbd-bkup.txt
```

Inside `dconf-edtior` desktop keybindings (WM/Window Manager in settings are at)

```
# RUN ALSO
dconf dump /org/gnome/desktop/wm/keybindings/ > dconf-gnome-kbd-wm.txt
dconf load /org/gnome/desktop/wm/keybindings/ < dconf-gnome-kbd-wm.txt

```

*dconf only dumps non-default values so if there's no output nothing is customised.
