#!/bin/bash

### --------------------------------------------------------------------
### seafile-internal-link
### --------------------------------------------------------------------

if [ "$1" ]
then
    TARGET="$1"
elif [ "$PREFIX" ]
then
    TARGET="$PREFIX/bin"
else
    TARGET="/usr/local/bin"
fi


# check prereqs
[ "`which sqlite3`" ] || { "Error: You need 'sqlite3' to run seafile-internal-link" >&2; exit 1; }

#[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
#    echo "You do not have write-access to $TARGET -- re-run as root or use sudo" >&2
#    exit 2
#}

FILE="seafile-internal-link"
sudo install --mode=555 "$FILE" "$TARGET" && echo "$FILE installed"

### --------------------------------------------------------------------
### nautilus-seafile-internal-link
### --------------------------------------------------------------------

# prereqs

if [ -z "`which zenity`" ]
then
    echo "The 'nautilus-seafile-internal-link' is not installed because it looks like you do" 
    echo "not have 'zenity' installed"
    exit
fi
if [ -z "`which nautilus`" ]
then
    echo "The 'nautilus-seafile-internal-link' is not installed because it looks like you do" 
    echo "not have 'nautilus' installed"
    exit
fi

TARGET="$HOME/.local/share/nautilus/scripts/"
mkdir -p  ${TARGET} 2>&1 >/dev/null
[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
    echo "You do not have write-access to $TARGET -- re-run as root or use sudo" >&2
    exit 2
}

FILES='nautilus-seafile-internal-link nautilus-seafile-open-in-browser'
for FILE in $FILES
do
install --mode=555 "$FILE" "$TARGET" && {
    echo "$FILE installed for $USER"
}
done
