gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
bundle install
cd calculator
bundle install
cd ../caesar-cipher
bundle install
