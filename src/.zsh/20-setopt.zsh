# See also zshoptions(1)

# {{{ Changing Directories

# If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command
# to that directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Do not print the directory stack after pushd or popd.
setopt pushd_silent

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# }}}

# {{{ Completion, expansion and globbing

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

# }}}

# {{{ History

# Save each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.
setopt extended_history

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

# }}}

# {{{ Input/output

# Try to correct mistyped commands, but not other arguments
unsetopt correct_all
setopt correct

# Allow comments even in interactive shells.
setopt interactive_comments

# Do not query the user before executing `rm *' or `rm path/*'.
setopt rm_star_silent

# }}}

# {{{ Job control

# With this option set, stopped jobs that are removed from the job table with
# the disown builtin command are automatically sent a CONT signal to make them
# running.
setopt auto_continue

# Report  the  status of background and suspended jobs before exiting a shell
# with job control; a second attempt to exit the shell will succeed.
setopt check_jobs

# Check for both running and suspended jobs when CHECK_JOBS is enabled. When
# this option  is  disabled, zsh checks only for suspended jobs, which matches
# the default behavior of bash.
setopt check_running_jobs

# Send the HUP signal to running jobs when the shell exits.
setopt hup

# Print job notifications in the long format by default.
setopt long_list_jobs

# }}}

# {{{ Shell Emulation

# Make the echo builtin compatible with the BSD echo(0) command. This disables
# backslashed escape sequences in echo strings unless the -e option is
# specified.
setopt bsd_echo

# }}}

# {{{ Zsh Line Editor (ZLE)

# Don't beep on error in ZLE.
unsetopt beep

# }}}
