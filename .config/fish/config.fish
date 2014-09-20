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
    set -gx PATH $PATH ~/scripts ~/.cabal/bin ~/.rbenv/bin
    set -gx WORKON_HOME ~/.virtualenvs
    set -gx PROJECT_HOME ~/Code
end
set -gx TERM xterm-256color
 
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

function workon
    source ~/.virtualenvs/$argv[1]/bin/activate.fish
end

function greprs
    grep -Rn --exclude-dir='\.git' --include='*.rs' $argv
end

function grepy
    grep -Rn --exclude-dir='\.git' --include='*.py' $argv
end

function macs
    emacsclient -nw $argv
end

set -gx PATH $PATH ~/.rbenv/bin
status --is-interactive; and . (rbenv init -|psub)
