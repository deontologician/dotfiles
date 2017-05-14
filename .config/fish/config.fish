# -*- encoding: utf-8 -*-
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# PATH
if status --is-login
    set -gx WORKON_HOME ~/.virtualenvs
    set -gx PROJECT_HOME ~/Code
    set -gx NPM_PACKAGES ~/.npm-packages
end
set -gx PATH $PATH /usr/local/bin ~/scripts ~/.cabal/bin ~/.npm-packages/bin ~/.cargo/bin

if test -n "$EMACS"
    set -gx TERM eterm-color
else
    set -gx TERM xterm-256color
end

function fish_prompt
        set last_status $status
        if set -q VIRTUAL_ENV
           printf '(%s)' (basename $VIRTUAL_ENV)
        end
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end

function macs
    emacsclient -nw $argv
end
