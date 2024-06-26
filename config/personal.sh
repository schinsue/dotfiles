export GIT_AUTHOR_NAME="Sergio Chin-Sue"
export GIT_AUTHOR_EMAIL="s.chinsue@gmail.com"
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

PROJECT_PARENT_DIRS+=("$HOME/Projects")

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval $(keychain --eval id_ed25519 -q)
fi
