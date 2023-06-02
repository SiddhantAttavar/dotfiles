# Satisfying the linter
c = c
config = config

# Importing packages
from glob import glob
from os import name as os_name

# Colorscheme
config.source('qutebrowser-themes/themes/onedark.py')

# Change downloads directory if windows
if os_name == 'nt':
	c.downloads.location.directory = 'D:\\Downloads'
	c.completion.favorite_paths = ['D:\\Downloads']
else:
	c.downloads.location.directory = '$HOME/d/Downloads'
	c.completion.favorite_paths = ['$HOME/d/Downloads']

# Load autoconfig.yml
config.load_autoconfig()

# Change downloads directory if windows
if os_name == 'nt':
	c.downloads.location.directory = 'D:\\Downloads'

# Keybindings
config.bind('<z><l>', 'spawn --userscript password_fill --dmenu-invocation zenity')
config.bind('<z><u>', 'spawn --userscript password_fill --dmenu-invocation zenity --username-only')
config.bind('<z><p>', 'spawn --userscript password_fill --dmenu-invocation zenity --password-only')

# Enable userstyles
userstyles = glob('../userstyles/*.user.css')
c.content.user_stylesheets = userstyles
