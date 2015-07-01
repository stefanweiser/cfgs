#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

source /etc/lsb-release

function __check_for_container()
{
    if [ -e /var/lib/komax-containers ]; then
        echo -n "%F{white}%K{red}[cont]%k%f "
    fi
}

PROMPT='
%B$(__check_for_container)%(!.%F{red}.%F{green})%n@%M%f%F{white}[${DISTRIB_CODENAME}]%f  %F{yellow}%D{%d.%m.%Y %H:%M:%S}%f  %F{cyan}%d%f
$(git_prompt_info)$(git_prompt_status)%f$(hg_prompt_info)%f%(?.%F{green}.%K{red}%F{white})[%?]%f%k%b '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue}) "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%F{yellow}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}✹ "
ZSH_THEME_GIT_PROMPT_DELETED="%F{yellow}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{yellow}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{yellow}✭ "

ZSH_THEME_HG_PROMPT_PREFIX="%F{blue}("
ZSH_THEME_HG_PROMPT_SUFFIX="%F{blue}) "
ZSH_THEME_HG_PROMPT_DIRTY=" %F{red}✘"
ZSH_THEME_HG_PROMPT_CLEAN=" %F{green}✔"
