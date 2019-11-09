#!/bin/zsh
PLUGIN_BIN="$(dirname $0)/bin"
export PATH=${PATH}:${PLUGIN_BIN}

if (( $+commands[grc] )); then
	GRC=$(which -p grc)

	if [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
		alias colourify="${GRC} -es --colour=auto"

		# Use functions so we can still take advantage of ZSH completion functions
		for bin in ant blkid configure cvs df diff dig dnf docker du env \
			fdisk free getfacl getsebool id last ls lsattr lsblk lsmod lsof \
			lspci mount mtr mvn netstat nmap php ping ping2 proftpd ps pv ss \
			stat sysctl systemctl tcpdump traceroute tune2fs ulimit uptime vmstat wdiff;
			do
				if which $bin >/dev/null; then
					$bin() {
						\grc --colour=auto $0 "$@"
					}
				fi
		done
	fi
fi

# ANSI Color
# Attributes are in #;#;#...;#
# 0 reset, 1 bold, 4 underline, 5 flashing, 7 inverse
# Text
# 30 black, 31 red, 32 green, 33 yellow, 34 blue, 35 magenta, 36 cyan, 37 white
# Background colors are 40-47
# 100-107 are lighter variants
ANSI_RESET="\033[0;0m"
ANSI_BOLD="\033[1;1m"
ANSI_UNDERLINE="\033[4;4m"
ANSI_FLASH="\033[5;5m"
ANSI_INVERSE="\033[7;7m"

# text colors
ANSI_BLACK="\033[30;30m"
ANSI_RED="\033[31;31m"
ANSI_GREEN="\033[32;32m"
ANSI_YELLOW="\033[33;33m"
ANSI_BLUE="\033[34;34m"
ANSI_MAGENTA="\033[35;35m"
ANSI_CYAN="\033[36;36m"
ANSI_WHITE="\033[36;36m"

# background colors
ANSI_BG_BLACK="\033[40;40m"
ANSI_BG_RED="\033[41;41m"
ANSI_BG_GREEN="\033[42;42m"
ANSI_BG_YELLOW="\033[43;43m"
ANSI_BG_BLUE="\033[44;44m"
ANSI_BG_MAGENTA="\033[45;45m"
ANSI_BG_CYAN="\033[46;46m"
ANSI_BG_WHITE="\033[47;47m"

# Configure colors, if available.
if (( $+commands[tput] )); then
	tput setaf 1 >&/dev/null
	c_reset='\[\e[0m\]'
	# c_user='\[\033[1;33m\]'
	# c_path='\[\e[0;33m\]'
	# c_git_clean='\[\e[0;36m\]'
	# c_git_dirty='\[\e[0;35m\]'
	c_user=${ANSI_CYAN}
	c_path=${ANSI_LIGHT_BLUE}
	c_git_clean=${ANSI_LIGHT_GREEN}
	c_git_dirty=${ANSI_LIGHT_RED}
else
	c_reset=
	c_user=
	c_path=
	c_git_clean=
	c_git_dirty=
fi

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
LS_COLORS='no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cc=00;38;5;245:*.sqlite=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:';
export LS_COLORS
