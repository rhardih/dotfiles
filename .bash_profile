# Exports

export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS='-m --height 50%'
export LC_ALL=en_US.UTF-8
export PATH=~/.dotfiles/bin:$PATH


# Git

# Decorate prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Add tab completion for commands and branches
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi


# Utils

# Offline a website
function offline() {
  httrack "$@"
}

# show gzip compression ratio for a given url
function gzratio()
{
  tmp_file=$(mktemp)
  compressed=$( \
    curl -v -so /dev/null --compressed "$1" -w '%{size_download}' 2> $tmp_file \
  )
  uncompressed=$(curl -so /dev/null "$1" -w '%{size_download}')
  ratio=$(bc -l <<< "($uncompressed - $compressed) / $uncompressed * 100")

  grep "Content-Encoding" $tmp_file | sed "s/< //g"

  echo "Uncompressed: $uncompressed bytes"
  echo "Compressed: $compressed bytes"
  printf "Compression ratio: %.2f%%\n" $ratio

  rm $tmp_file
}

# Lorem ipsum

function curlipsum()
{
  curl http://metaphorpsum.com/paragraphs/$1/$2
}

# docker-cleanup
#
# Removes old and unused docker images and containers
#
# https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
function docker-cleanup()
{
  docker rm $(docker ps -qa --no-trunc --filter "status=exited")

  docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
  #docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
}

# docker-name-ip
#
# List running containers with name and internal ip addresses
function docker-name-ip()
{
  format='{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' 

  docker ps -q | xargs -n 1 docker inspect --format "$format" | sed 's#^/##';
}

# git-biggest
#
# Shows the size and name of the 20 biggest files in a git repository
function git-biggest()
{
  git ls-tree -r -l --full-name HEAD | \
    awk '{print $4, $5}' | \
    sort -n -r | \
    head -20 | \
    numfmt --to=iec
}

# bak
#
# Creates a copy of a file with a .bak extension
function bak()
{
  cp "$@"{,.bak}
}

function unbak()
{
  mv "$@" "${@%.bak}"
}

# Load OS specific variants of .bash_profile

case "$(uname -s)" in
	Linux*) . ~/.dotfiles/linux/.bash_profile;;
	Darwin*) . ~/.dotfiles/darwin/.bash_profile;;
	*) echo "Unknown system $(uname -s)"
esac
