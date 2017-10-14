echo "Setting aliases..."
#
# app1の環境下でのコマンドを実行するのに用いる親エイリアス
#
alias dcrun="docker-compose run --rm web"
type dcrun

#
# Bundle Execute
#
# Example:
# dcrun-be rails g migration AddSomeColumnToTable
# = bundle exec rails g migration AddSomeColumnToTable
#
alias dcrun-be="dcrun bundle exec"
type dcrun-be

#
# Rails Console
#
alias dcrun-be-c="dcrun-be rails c"
type dcrun-be-c

#
# テスト実行
#
# Example:
# dcrun-test TEST=test/**/*_test.rb
# = bundle exec rake test TEST=test/**/*_test.rb
#
alias dcrun-test="dcrun-be rake test"
type dcrun-test

#
# DB接続
#
alias dcrun-psql="dcrun psql -h db -p 5432 -U postgres"
type dcrun-psql
