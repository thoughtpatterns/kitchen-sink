define-command -hidden buflist-assemble %{ nop %sh{{
	buflist=
	eval set -- "$kak_quoted_buflist"

	for buffer
	do
		if [ "$buffer" = "$kak_bufname" ]
		then active=true
		else active=false
		fi

		buffer="$(printf %s "$buffer" | luajit -e '
			local map = {
			    ["\""] = "\\\"",
			    ["\\"] = "\\\\",
			    ["\b"] = "\\b",
			    ["\f"] = "\\f",
			    ["\n"] = "\\n",
			    ["\r"] = "\\r",
			    ["\t"] = "\\t",
			}

			io.write((string.gsub(io.read("a"), [[([\\"%c])]], function(c)
			    return map[c] or string.format("\\u%04x", string.byte(c))
			end)))
		')"

		buflist="$buflist"' { "text": "'"$buffer"'", "active": '$active' },'
	done

	> "$kak_client_env_TTY" printf           \
		"\033]1337;SetUserVar=%s=%s\007" \
		buflist                          \
		"$(printf %s "[ ${buflist%,} ]" | base64 -w 0)"
} < /dev/null > /dev/null 2>&1 & }}

hook global BufClose    '.*' buflist-assemble
hook global FocusIn     '.*' buflist-assemble
hook global KakBegin    '.*' buflist-assemble
hook global WinCreate   '.*' buflist-assemble
hook global WinDisplay  '.*' buflist-assemble
hook global ClientClose '.*' %{ nop %sh{ > "$kak_client_env_TTY" printf "\033]1337;SetUserVar=%s=\007" buflist }}
