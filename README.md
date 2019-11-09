# colorize.zsh

Colorize command output using `grc` (when present) and lscolors.

Forked from: unixorn/warhol.plugin.zsh

## Installing

### [Zgen](https://github.com/tarjoilija/zgen)

Add `zgen load DerBunman/colorize.zsh` to your .zshrc with your other load commands.

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle DerBunman/colorize.zsh` to your .zshrc

### Without using any frameworks

## Tips

Customizing `LSCOLORS` for OSX/*BSD and `LS_COLORS` for Linux is a hassle. It's even more of a hassle to keep them in sync across *BSD and Linux.

Fortunately, Geoff Greer made an online tool that makes it easy to customize your color scheme and keep them in sync across Linux and OS X/*BSD available online at [lscolors](http://geoff.greer.fm/lscolors/). I've included my `LSCOLORS` and `LS_COLORS` settings in this plugin, but they won't be applied if you already have set `LSCOLORS` or `LS_COLORS`.

The easiest way to change them if you use a ZSH framework is to redeclare the variables in your `.zshrc` after your framework loads your plugins.

