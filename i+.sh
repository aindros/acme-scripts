#!/bin/sh

sed -E 's/^(.*)/    \1/'
exit

# Don't use this
#echo -n `9p read acme/$winid/data | sed 's|^|    |'` | 9p write acme/$winid/data

# But this
echo addr=dot | 9p write acme/$winid/ctl
echo -n "    " | 9p write acme/$winid/data

exit

echo addr=dot | 9p write acme/$winid/ctl
echo -n '__MARKER__' | 9p write acme/$winid/data
echo -n '/^.*__MARKER__/' | 9p write acme/$winid/addr
line=$(9p read acme/$winid/data | sed 1q)

echo -n '/^.*__MARKER__.*\n?/' | 9p write acme/$winid/addr
before_marker=$(echo "$line" | sed -E 's/(.*)__MARKER__/\1/')

line=$(echo "$line" | sed -E 's/__MARKER__//')
echo -n "    $before_marker" | 9p write acme/$winid/data

