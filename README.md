# bradical does dotfiles

This is my fork of [zholman/dotfiles](https://github.com/zholman/dotfiles/)

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## properties files and other files not under version control

The [mysql scripts](https://github.com/bradical/dotfiles/blob/master/mysql/mysql.zsh) require a file called `mysql.properties` to exist in the `mysql` sub-directory and contain the following properties. It is ignored so as to avoid committing passwords to source control.

```
USER=root
PASSWORD=<PASSWORD>
DEFAULT_DMP=<Path to a dump file to default to when refreshing or creating new databases>
DEFAULT_TEST_DMP=<Path to a dump file to default to when refreshing a test db>
DEFAULT_DB=<Name of the db to use if no db is specified>
DEFAULT_TEST_DB=<Name of the db to use for mrefreshtest if no name is specified>
```

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/bradical/dotfiles.git ~/Dev/dotfiles
cd ~/Dev/dotfiles
# Create a .giconfig.local and update it
cp ~/Dev/dotfiles/git/gitconfig.local.symlink.example ~/Dev/dotfiles/git/gitconfig.local.symlink
# Create a .localrc and update it
cp ~/Dev/dotfiles/zsh/localrc.symlink.example ~/Dev/dotfiles/zsh/localrc.symlink
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/Dev/dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as _my_ dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/holman/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Zach Holmans dotfiles](http://github.com/holman/dotfiles) and he forked 
[Ryan Bates](http://github.com/ryanb)' excellent [dotfiles](http://github.com/ryanb/dotfiles) 
for a couple years before the weight of his changes and tweaks inspired Zach to finally roll his own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
