namespace :dev do 
  desc "Build system"
  # NOTE: 清掉所有資料，建立空的資料表
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]

  desc "Rebuild system"
  # NOTE: 清掉所有資料之外，再產生基本需要的種子資料
  task :rebuild => ["dev:build", "db:seed"]

  desc "Generate fake data"
  # NOTE: 產生假資料：10 個以上的看板、裡面各自包含不定數量之文章 (1 ~ 20 篇)
  task :fake => :environment do
    require 'populator'
    require 'faker'

    puts "Generating fake data..."

    puts "Generating 5 fake users..."

    password = "12345678"

    User.populate 5 do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(:password => password).encrypted_password
      user.sign_in_count = 0
      user.is_admin = false
    end

    puts "Generating boards & posts..."

    Board.populate 10..15 do |board|
      board.name = Populator.words(3..15).titleize
      Post.populate 1..20 do |post|
        post.title = Faker::Lorem.sentence
        post.content = Faker::Lorem.paragraph
        post.board_id = board.id
        post.user_id = User.first(:offset => rand(User.count))
      end
    end
  end
end
