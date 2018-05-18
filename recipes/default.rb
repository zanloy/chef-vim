#
# Cookbook:: vim
# Recipe:: default
#
# Copyright:: 2018, Zan Loy

vim_pkgs = ['vim']
fam_deb = %w(debian arch)
fam_rhel = %w(rhel fedora)

case node['platform_family']
when *fam_deb
  conf_file = '/etc/vim/vimrc'
when *fam_rhel
  vim_pkgs = ['vim-minimal', 'vim-enhanced']
end

package vim_pkgs

template 'vimrc' do
  path node['vim']['conf_file']
  source 'vimrc.erb'
  mode '0444'
  owner 'root'
  group 'root'
  helper(:vim_conf) { |setting| node['vim'][setting] }
end
