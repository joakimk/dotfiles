bash "Install dotfiles" do
  user "jocke"
  cwd "/home/jocke"
  code <<EOS
    set -e
    export HOME=/home/jocke
    source /home/jocke/.profile
    git clone git@github.com:joakimk/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake
EOS

  not_if do
    File.exists?("/home/jocke/.dotfiles")
  end
end
