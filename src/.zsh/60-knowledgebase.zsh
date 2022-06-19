if type knowledgebase > /dev/null; then
	function knowledgebase_binary() {
		# Helper function to determines the real knowledgebase binary path,
		# used to avoid endless self-recursion because we're redefining
		# "knowledgebase" as a function (and aliasing kbX to it).
		#
		# Calling /bin/which avoids shell built-ins otherwise we'd still get
		# the function alias here.
		if [[ -e /bin/which ]]; then
			# Linux
			/bin/which knowledgebase
		else
			# Mac OSX
			/usr/bin/which knowledgebase
		fi
	}
	function knowledgebase_sitemap_select() {
		URL="$($(knowledgebase_binary) sitemap "$@" | rofi -dmenu -no-custom -i)"
		if [[ $? -ne 0 ]]; then; return; fi

		if [[ -v WAYLAND_DISPLAY ]]; then
			printf "$URL" | wl-copy
		else
			printf "$URL" | xclip -selection clipboard
		fi
		notify-send "URL copied to clipboard" "$URL"
	}
	function knowledgebase() {
		if [ "$#" -lt 1 ]; then
			cd "$HOME/Knowledgebase"
			git status --short
		elif [[ "$1" == "sitemap-select" ]]; then
			shift
			knowledgebase_sitemap_select "$@"
		else
			$(knowledgebase_binary) "$@"
		fi
	}
	alias kb=knowledgebase
	alias kbc="knowledgebase commit"
	alias kbd="knowledgebase diff"
	alias kbj="knowledgebase journal"
	alias kbn="knowledgebase new"
	alias kbs="knowledgebase sync"
fi

