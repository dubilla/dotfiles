alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"
alias rk="rake"
alias s="rspec"

# Bundler
alias b="bundle"

# Tests and Specs
alias t="ruby -I test"

alias migrate="bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=test"
alias zues="zeus"
alias z="zeus"

alias migrate='bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test'
alias fixtestdb="rake db:drop RAILS_ENV=test; createdb -O viewthespace -E utf8 viewthespace_test; rake db:migrate RAILS_ENV=test"

alias nuketestdb="RAILS_ENV=test rake db:drop db:create db:migrate"
