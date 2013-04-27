Robert Qualls dotfiles
===================

Description
-----------

These are my personal dotfiles based on the thoughtbot dotfiles.  I mention that
to give credit where it is due, not because the dotfiles are compatible with the
originals.  For the foreseeable future, these dotfiles will be very
vim/webdev oriented, but I haven't settled on a stable configuration yet, so you 
should probably just stick with the original thoughtbot files if you are looking 
for a quick fix.

If you are looking for the original thoughbot dotfiles, you can get them here:
http://github.com/thoughtbot/dotfiles

Install
-------

Clone onto your filesystem:

    git clone git://github.com/rlqualls/dotfiles.git

Install:

    cd dotfiles
    ./install.sh

This will create symlinks for config files in your home directory. If you
include the line "DO NOT EDIT BELOW THIS LINE" anywhere in a config file, it
will copy that file over instead of symlinking it, and it will leave
everything above that line in your local config intact.

You can safely run `./install.sh` multiple times to update.
