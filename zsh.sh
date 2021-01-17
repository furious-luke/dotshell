function e {
    emacs -nw $1
}

function o {
    xdg-open $1
}

alias c="xclip -selection clipboard"

CURRENT_UID=$(id -u):$(id -g)

function findlatest {
    find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head
}
