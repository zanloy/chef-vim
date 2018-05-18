#
# Cookbook:: vim
# Recipe:: default
#
# Copyright:: 2018, Zan Loy

vim_pkgs = value_for_platform_family(
  %w(debian arch) => ['vim'],
  %w(rhel fedora) => ['vim-minimal', 'vim-enhanced'],
  'default'       => ['vim']
)

package vim_pkgs

template 'vimrc' do
  path node['vim']['conf_file']
  source 'vimrc.erb'
  mode '0444'
  owner 'root'
  group 'root'
  helper(:vim_conf) { |setting| node['vim'][setting] }
end
