# howto
https://jekyllrb.com

# install
```
# https://jekyllrb.com/docs/installation/ubuntu/

yum install ruby
ruby -v
# update ruby on centos
# https://blog.csdn.net/qq_26440803/article/details/82717244
gem sources -a http://mirrors.aliyun.com/rubygems/
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
rvm list known
RUBY_VERSION=2.6
rvm install "$RUBY_VERSION"
ruby -v|grep "$RUBY_VERSION" || exit 1

echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
# relogin in the other terminal, or do this
source ~/.bashrc
# Q: extconf failedCannot allocate memory
# A: release some memory and try again; 
# or: https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7
# fallocate && chmod 600 && mkswap && swapon && /etc/fstab && swapoff
gem install jekyll bundler
```

# structure
https://jekyllrb.com/docs/structure/
```
# bak and remove firstly
jekyll new docs
# local test
bundle exec jekyll serve -H 127.0.0.1
```

# config
https://github.com/jekyll/jekyll/blob/master/docs/_config.yml

# example @TODO: copy
https://github.com/jekyll/jekyll
