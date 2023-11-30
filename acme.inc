fn_set_tag()
{
	echo 'cleartag' | 9p write acme/$winid/ctl
	echo -n " $@" | 9p write acme/$winid/tag
#	echo 'clean' | 9p write acme/$winid/ctl
}

fn_append_tag()
{
	echo -n "$1" | 9p write acme/$winid/tag
}

fn_get_tag()
{
	9p read acme/$winid/tag
}

fn_write_click_event()
{
	local eventType=$1 offset=$2 end=$3

#	echo "M$eventType$offset $end"
	echo "M$eventType$offset $end" | 9p write "acme/$winid/event"
}

fn_exec_cmd_tag()
{
	local cmd_size=$(echo -n "$1" | wc -c | awk '{print $1}')
	local start=$(echo `fn_get_tag` | sed -E 's/( Snarf )[^\|]*/\1/g' | grep -aob "$1" | sed 's/:.*//g')
	if [ -z $start ]; then
		fn_append_tag " ($1)"
		start=$(echo `fn_get_tag` | sed -E 's/( Snarf )[^\|]*/\1/g' | grep -aob "$1" | sed 's/:.*//g')
	fi
	local end=$(expr $start + $cmd_size)

	fn_write_click_event x $start $end
}

fn_win_tag()
{
	9p read "acme/$winid/tag" | sed -E 's/( Snarf ).*/\1/'
}

fn_win_tag_size()
{
	fn_win_tag | wc -c | awk '{print $1}'
}

fn_user_tag()
{
	9p read "acme/$winid/tag" | cut -d'|' -f2 | xargs
}

fn_user_tag_pos()
{
	local size=$(fn_win_tag_size)
	expr $size + 1
}
