
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'none'
set __fish_git_prompt_color_branch purple
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
#set __fish_git_prompt_char_dirtystate '⌵'
#set __fish_git_prompt_char_dirtystate 'ȯ'
set __fish_git_prompt_char_dirtystate '༅'
# set __fish_git_prompt_char_dirtystate '𝍖'
set __fish_git_prompt_char_stagedstate ''
set __fish_git_prompt_char_untrackedfiles ''
set __fish_git_prompt_char_stashstate ''
set __fish_git_prompt_char_upstream_ahead ''
set __fish_git_prompt_char_upstream_behind ''


function fish_prompt
  set last_status $status

  set_color brcyan
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s\n> ' (__fish_git_prompt)

  set_color normal
end

alias gs 'git status'
alias gd 'git diff'
alias gb 'git branch'
alias g 'git'
alias gco 'git checkout'
alias gcm 'git commit -m'
alias gcam 'git commit -am'
alias git 'hub'
alias r 'bin/rspec --color'
alias glg "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias help 'tldr'
alias vlc 'nvim -O (git log --pretty=format: --name-only -n 1)'
alias rc 'rails c'
alias c 'cd ~/src/coinbase'
alias s 'cd ~/src/'
function gsup
  set BRANCH (git rev-parse --abbrev-ref HEAD 2>/dev/null);
  git push --set-upstream origin $BRANCH
end
function gpr
  gsup
  git pull-request -o -c $argv
end


set PATH "~/.rbenv/shims" $PATH
set PATH "~/go/bin/" $PATH
set PATH $PATH:(go env GOPATH)/bin
set PATH "/Users/andrewflockhart/.nodenv/shims:" $PATH
status --is-interactive; and source (rbenv init -|psub)

bass source `which assume-role`
set -x SAML_IDP_ASSERTION_URL "https://sso.cbhq.net/api/v1/saml/sso"
set -x AWS_ASSUME_ROLE_AUTH_SCHEME "saml"
set -x SAML_IDP_REQUEST_BODY_TEMPLATE '{"service": "aws", "email": "$saml_user", "password": "$saml_password"}'
set -x SAML_IDP_NAME 'saml-idp'
set -x PATH /usr/local/opt/docker-credential-helper-ecr/bin:$PATH
set -x GOPROXY https://gomodules.cbhq.net/
