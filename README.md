# Acme Scripts

This is a collection of useful scripts used by me to extend Acme Editor.

## c+
Adds a comment to the beginning of the line. By default insert a double slash
(//) but can be changed it's behaviour passing the symbol you want to use to
comment the line. FOr example:
```
echo test line | c+
> //test line
```
or with a custom symbol:
```
echo test line | c+ \#
> #test line
```