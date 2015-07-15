source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Pagenation
gem 'kaminari'
# NewRelic
gem 'newrelic_rpm'
# Haml
gem 'haml-rails'
# Admin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'rails-i18n'

gem "therubyracer", :platforms => :ruby

gem 'acts-as-taggable-on'

gem 'chosen-rails', git: 'git://github.com/qpowell/chosen-rails.git'
gem 'font-awesome-rails'
gem 'select2-rails'
gem 'tagsinput-rails'

group :development, :test do
  gem 'erb2haml'
  gem 'powder'
  # Rails application preloader
  gem 'spring'
  # Railsコンソールの多機能版
  gem 'pry-rails'
  # pryの入力に色付け
  gem 'pry-coolline'
  # デバッカー
  gem 'pry-byebug'
  # Pryでの便利コマンド
  gem 'pry-doc'
  # PryでのSQLの結果を綺麗に表示
  gem 'hirb'
  gem 'hirb-unicode'
  # pryの色付けをしてくれる
  gem 'awesome_print'
  # Rspec
  gem 'rspec-rails'
  gem 'rake_shared_context'
  # fixtureの代わり
  gem "factory_girl_rails"
  # テスト環境のテーブルをきれいにする
  gem 'database_rewinder'
  # Guard
  gem 'guard-rspec'
  gem 'guard-spring'
end

group :production, :staging do
  # ログ保存先変更、静的アセット Heroku 向けに調整
  gem 'rails_12factor'
end
