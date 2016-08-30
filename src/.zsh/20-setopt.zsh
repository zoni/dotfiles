# If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command
# to that directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# If the argument to a cd command (or an implied cd with the AUTO_CD
# option set) is not a directory, and does not begin with a slash,
# try to expand the expression as if it were preceded by a `~' (see
# *note Filename Expansion::).
setopt cdable_vars

# Do not print the directory stack after pushd or popd.
setopt pushd_silent

# When the current word has a glob pattern, do not insert all the words resulting  from
# the  expansion  but  generate  matches  as for completion and cycle through them like
# MENU_COMPLETE. The matches are generated as if a `*' was added  to  the  end  of  the
# word,  or  inserted  at  the cursor when COMPLETE_IN_WORD is set.  This actually uses
# pattern matching, not globbing, so it works not only for files but  for  any  comple‐
# tion, such as options, user names, etc.
setopt glob_complete

# Do not require a leading `.' in a filename to be matched explicitly.
unsetopt glob_dots

# If set, regular expression matching with the =~  operator  will  use  Perl-Compatible
# Regular Expressions from the PCRE library, if available.  If not set, regular expres‐
# sions will use the extended regexp syntax provided by the system libraries.
setopt rematch_pcre

# Don't add commands to history file when preceded by spaces
setopt hist_ignore_space

# Append to history file rather than overwriting
setopt append_history

# When writing out the history file, by default zsh uses ad-hoc file locking  to  avoid
# known  problems  with locking on some operating systems.  With this option locking is
# done by means of the system's fcntl call, where this method is available.  On  recent
# operating systems this may provide better performance, in particular avoiding history
# corruption when files are stored on NFS.
setopt hist_fcntl_lock

# If  a  new  command line being added to the history list duplicates an older one, the
# older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups

# Whenever  the  user  enters  a  line  with  history expansion, don't execute the line
# directly; instead, perform history expansion and reload the  line  into  the  editing
# buffer.
setopt hist_verify

# This options works like APPEND_HISTORY except that new history lines are added to the
# $HISTFILE incrementally (as soon as they are entered), rather than waiting until  the
# shell exits.  The file will still be periodically re-written to trim it when the num‐
# ber of lines grows 20%  beyond  the  value  specified  by  $SAVEHIST  (see  also  the
# HIST_SAVE_BY_COPY option).
setopt inc_append_history

# This  option  both  imports  new commands from the history file, and also causes your
# typed commands to be appended to the history file  (the  latter  is  like  specifying
# INC_APPEND_HISTORY).    The  history  lines  are  also  output  with  timestamps  ala
# EXTENDED_HISTORY (which makes it easier to find the spot where we  left  off  reading
# the file after it gets re-written).
unsetopt share_history

# Try to correct mistyped commands, but not other arguments
unsetopt correct_all
setopt correct

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups
