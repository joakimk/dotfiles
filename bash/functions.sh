# cd gem
#     
#     macbook:auktion (master) $ cdgem thor
#     macbook:thor-0.14.6 $ pwd
#     /Users/jocke/.rvm/gems/ree-1.8.7-2010.02@auktion/gems/thor-0.14.6
#
function cdgem {
  cd `rvm gemdir`/gems; cd `ls|grep $1|sort|tail -1`
}

# Print working file.
#
#     henrik@Henrik ~/.dotfiles[master]$ pwf ackrc 
#     /Users/henrik/.dotfiles/ackrc
#
function pwf {
  echo "$PWD/$1"
}

# Create directory and cd to it.
#
#     henrik@Nyx /tmp$ mkcd foo/bar/baz
#     henrik@Nyx /tmp/foo/bar/baz$
#
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# SSH to the given machine and add your id_rsa.pub or id_dsa.pub to authorized_keys.
#
#     henrik@Nyx ~$ sshkey hyper
#     Password:
#     sshkey done.
function sshkey {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub
  echo "sshkey done."
}

# Open the .xcodeproj file from the working directory (typically in Xcode).
#
#     henrik@Nyx ~/Code/iPhone/MyApp$ xc
#     # equivalent to:
#     open ~/Code/iPhone/MyApp/MyApp.xcodeproj
#
function xc {
  open `ls | grep .xcodeproj`
}

# Generate a Ruby on Rails migration, then open the generated file.
#
#     henrik@Nyx /myproject$ migg add_fooed_at_to_bars fooed_at:datetime
function migg {
  script/generate migration $@ | ruby -e 'x = ARGF.read; puts x; path = x[/create\s+(.+)/, 1]; system("open", path)'
}

# "git commit all"
# Commits all changes, deletions and additions.
# When given an argument, uses that for a message.
# With no argument, opens an editor that also shows the diff (-v).
function gca {
  git add --all && ([ -z "$1" ] && git commit -v || git commit -m "$1")
}
