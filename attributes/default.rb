default['vim']['bg_shading']          = 'dark'
default['vim']['indent']              = true
default['vim']['save_lastposition']   = true
default['vim']['powersave']           = true
default['vim']['syntax_highlighting'] = true
default['vim']['misc']                = []
default['vim']['maps']                = {}
default['vim']['autocmds']            = ['FileType python setlocal shiftwidth=4 tabstop=4']
default['vim']['statusline']          = "%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\\ %P"

# Platform specific attributes
case node['platform_family']
when 'debian'
  default['vim']['conf_file'] = '/etc/vim/vimrc'
else
  default['vim']['conf_file'] = '/etc/vimrc'
end
