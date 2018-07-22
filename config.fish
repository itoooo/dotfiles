function fish_vi_cursor; end

fish_vi_key_bindings

# Enable Ctrl-F in vi insert mode
function fish_user_key_bindings
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
end

set -x GOPATH ~/go

alias vi='/usr/bin/vim'

set -g theme_color_scheme dracula
