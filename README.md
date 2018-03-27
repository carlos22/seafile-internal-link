README
======

A script to create Seafile internal-links from the command line plus a
wrapper that allows you to use it from Nautilus.

Based on: https://github.com/abandholm/seafile-share-link

This functionality could probably be done in a better way, and be installed
along with the Seafile client itself - but until then, you can use these two
scripts.

**Version:** 0.1

**License:** [Unlicensed](http://unlicense.org/) - do what you want! :-)


How do I set it up?
-------------------

### Prerequisites ###

The install-script checks for the prerequisites.

`seafile-internal-link` requires that `sqlite3` is installed.

`nautilus-seafile-internal-link` is meant to be called as a "Nautilus Script".
Finally `zenity` is used for the dialog boxes. Chances are good that you
have 'zenity' installed if you have Nautilus.

### Installation ###

    ./install.sh

The nautilus-script is installed in `$HOME/.local/share/nautilus/scripts/`. 
So you should run the script with the user you want it to be installed. The installer will ask you for the root password to install the `seafile-internal-link`

### Example - command line ###

    $ cd /home/aba/Seafile/pfc/AroFotos/portraits
    $ seafile-internal-link kislas.jpg

or with full path:

    $ seafile-internal-link /home/aba/Seafile/pfc/AroFotos/portraits/kislas.jpg
