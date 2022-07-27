# xdg variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config

# ~/ cleanup
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="${XDG_CACHE_HOME}"/less/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export WINEPREFIX="$XDG_DATA_HOME"/wine
# export XINITRC="$XDG_CONFIG_HOME"/xinitrc

# smooth scrolling in firefox
export MOZ_USE_XINPUT2=1

export GTK_THEME="$(grep 'gtk-theme-name' "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini" | sed 's/.*\s*=\s*//')"

CM_SELECTIONS=clipboard

export PATH="/home/lubunuku/.local/bin:$PATH"
