# Acme Scripts

This is a collection of useful scripts used by me to extend Acme Editor.

## start-acme
Starts our favorite editor. ;)

## c+
Adds a comment to the beginning of the line. By default inserts a double slash
(//) but can be changed the behaviour passing the symbol you want to use.
For example:
```
echo test line | c+
> //test line
```
or with a custom symbol:
```
echo test line | c+ "#"
> #test line
```

## c-
Same as `c+.sh` but removes a comment from the beginning of the line. By
default removes a double slash (//) but can be changed the behaviour passing
the symbol you want to remove.
For example:
```
echo //test line | c-
> test line
```
or with a custom symbol:
```
echo "#test line" | c- "#"
> test line
```

## clbuff
Clear the buffer. Is equivalent to do:
```
Edit ,
```
and then delete the whole selection.