# .dotfiles

> In Unix-like operating systems, any file or folder that starts with a dot character (for example, /home/user/.config), commonly called a dot file or dotfile, is to be treated as hidden.
> A convention arose of using dotfile in the user's home directory to store per-user configuration or informational text.

Screenshot:

![alt text][logo]

[logo]: https://i.imgur.com/ubeMEuq.png "Example"

Here are the settings I use.

* Ruby / Elixir / Node
* Tmux
* Vim

## Installation (10 simple steps to enlightenment)

These are the steps for installing a clean machine:

1. Install [iTerm2](http://www.iterm2.com/)
2. Install the dotfiles:

        git clone https://github.com/schinsue/dotfiles.git ~/.dotfiles
        cd ~/.dotfiles
        ./script/install

    This will backup any previous dotfiles you have.

3. Configure iTerm2:

    * Open iTerm2.
    * Go to the Preferences (⌘,)
    * In the General tab, check `Load preferences from a custom folder or URL`.
    * Fill in the text field to point to `/Users/your_name/.dotfiles/iterm2`.
      (replace "your_name" with your username, which you can verify by running `whoami`)
    * In the Profiles tab Text and set Font to MesloLGS NF. Alternatively, type p10k configure and answer Yes when asked whether to install Meslo Nerd Font.
    * Restart iTerm2.
   
4. Configure Git to use your own name:

    Add and change these lines to `~/.dotfiles/config/personal.sh`:

        export GIT_AUTHOR_NAME="Your Name"
        export GIT_AUTHOR_EMAIL="yourname@yourdomain.com"
        export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
        export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

5. Celebrate!

## Config

Here are some more things you can do.

### Tmux
Tmux autostarts with oh-my-zsh.

Shortcuts are documented here [tmux](https://github.com/gpakosz/.tmux)

### Vim

Vim will automatically install itself when you start Vim for the first time.

Delete (or move) your `~/.vim` directory to let it install.

After plugins install run:

    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --all

This is for autocomplete in VIM

### Personal Configuration

You can put configuration options that are personal, like custom paths, and
other environment variables in one of these files:

* `config/personal.sh` (will be loaded in both Bash and ZSH)
* `config/personal.zsh` (ZSH specific configuration)
* `config/personal.bash` (Bash specific configuration)

### Project aliases

This scripts adds aliases for your project directories, but you'll have to tell
it where your projects can be found. There are however differences in ZSH and
Bash syntax. Use the personal configuration files as mentioned above to set
them.

For ZSH:

    PROJECT_PARENT_DIRS+=("$HOME/Work")
    PROJECT_PARENT_DIRS+=("$HOME/Personal")

For Bash:

    PROJECT_PARENT_DIRS[0]="$HOME/Work"
    PROJECT_PARENT_DIRS[0]="$HOME/Personal"

Add as many directories as you like.

### Fonts

I'm using powerlevel10k as font: https://github.com/romkatv/powerlevel10k

**NB** Don't forget to read the output and follow the instructions.

Some Ruby related stuff:

    curl get.pow.cx | sh
    gem install bundler pry pry-doc powder

### Aliases

There are a lot of aliases in my dotfiles.
Here are the ones I use on a daily basis:

* `aa` - `git add --all && git status -sb`
* `c` - `git commit`
* `p` - `git push`
* `st` - `git status`
* `f` - `git fetch --all && git status`
* `up` - `git pull --ff-only`
* `upstash` - `git stash && git pull --ff-only && git stash pop`
* `unstage` - an autocompletable version of `git reset HEAD --`
* `co` - `git checkout`
* `d` - `git diff`
* `dc` - `git diff --cached`
* `m` - `macvim --remote-silent`
* `b` - a function that does `bundle check && bundle install` in a clever way
* `be` - `bundle exec`
* `rdm` - `rake db:migrate db:test:prepare`
* `l` - `ls -FhAlo`
* `mcd` - Make dir and change into it
* `lzp` - git add . --> git commit %arg% --> git push all in one command

## Credits

Thanks everybody who puts their dotfiles online. I copied a lot from
practically every repository.

Feel free to use this or fork this. Additions are very welcome!
