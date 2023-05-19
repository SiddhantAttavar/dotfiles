# Satisfying the linter
c = c
config = config

# Importing packages
from glob import glob

# Colorscheme
config.source('qutebrowser-themes/themes/onedark.py')

# Load autoconfig.yml
config.load_autoconfig()

# Keybindings
config.bind('<z><l>', 'spawn --userscript password_fill --dmenu-invocation zenity')
config.bind('<z><u>', 'spawn --userscript password_fill --dmenu-invocation zenity --username-only')
config.bind('<z><p>', 'spawn --userscript password_fill --dmenu-invocation zenity --password-only')

# Enable userstyles
userstyles = glob('../userstyles/*.user.css')
c.content.user_stylesheets = userstyles
