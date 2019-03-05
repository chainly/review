# add
touch
mkdir
cp

# del
rm
rmdir

# modify
touch
vim
echo

# list
ls

find
```
find ${where} -${filter} -${exec}

# filter
type
[cma]time
empty
...

# exec
exec cmd -args "{}"  # {} == found.path

# e.g.
find . -empty -type d |while read line
do
    ls -l "$line/xxx"
done
```

