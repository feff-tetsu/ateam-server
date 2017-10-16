# エイチームインターン向け

Dockerを使ってます
Docker for Macを入れてね:heart:

* Rails 5.1
* Ruby 2.3.1
run
## 環境構築
1. git clone  
よしなにして下しあ
2. エイリアスを張りましょう  
`. ./set-alias.sh`  
を実行すると
```
docker-compose run web --rm => dcrun
dcrun bundle exec => dcrun-be
dcrun-be rails console => dcrun-be-c
```
になります  
3. bundle install  
`dcrun bundle install`  
4. アップ
```
docker-compose build
docker-compose up
```
  
  で行ける気がする


