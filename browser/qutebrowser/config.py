c = c
config = config

config.source('qutebrowser-themes/themes/onedark.py')
config.load_autoconfig()
config.bind('<z><l>', 'spawn --userscript password_fill --dmenu-invocation zenity')
config.bind('<z><u>', 'spawn --userscript password_fill --dmenu-invocation zenity --username-only')
config.bind('<z><p>', 'spawn --userscript password_fill --dmenu-invocation zenity --password-only')
