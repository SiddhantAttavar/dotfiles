# Themes
config.source('qutebrowser-themes/themes/onedark.py')
config.load_autoconfig()
config.bind('<z>', 'spawn --userscript qute-pass --username-target secret --username-pattern "login: (.+)"')
