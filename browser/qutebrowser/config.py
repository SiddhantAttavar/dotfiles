from os import environ

# Satisfying the linter
c = c
config = config

# Importing packages
from glob import glob
from os import name as os_name

# Colorscheme
config.source('qutebrowser-themes/themes/onedark.py')

# Set downloads directory
assert 'DOWNLOADS_DIR' in environ
c.downloads.location.directory = environ.get('DOWNLOADS_DIR', 'D:\\downloads')

# Load autoconfig.yml
config.load_autoconfig()

# Keybindings
config.bind('<z><l>', 'spawn --userscript password_fill --dmenu-invocation zenity')
config.bind('<z><u>', 'spawn --userscript password_fill --dmenu-invocation zenity --username-only')
config.bind('<z><p>', 'spawn --userscript password_fill --dmenu-invocation zenity --password-only')

# Enable userstyles
userstyles = glob('../userstyles/*.user.css')
c.content.user_stylesheets = userstyles
