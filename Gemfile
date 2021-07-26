source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'will_paginate', '>= 3.0'
gem 'sprockets-rails' #là Asset Pipeline các file css, js thành 1 file nén khi đưa lên server
gem 'byebug'
gem 'figaro'#Quản lý toàn bộ biến môi trường của dự án tại 1 nơi trong file  config/application.yml(chạy bundle exec figaro install se sing ra file này)
gem 'sidekiq'
gem "redis-namespace"
gem "redis-rails"
gem "redis-rack-cache"
gem 'lograge'
gem 'lograge-sql'
gem 'bootstrap-sass'
#gem 'attach'#gem nay dom lam dung xai de upload
gem 'carrierwave' # Dung gem nay de upload
# Note: imprt/export csv khong can new gem, dung gem CSV co san bang cach require "csv"
gem "roo" #dùng để import,expoprt file excel 
gem "roo-xls"#dùng để import,export file excel di chung voi gem Roo o tren
gem "chatwork" #gui message toi chatwork
gem "koala" #gem send post to FB
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f' #Gem dùng hổ tro ảnh cho gem paperclip
gem "ckeditor" #tạo ra các form text soạn thảo văn bản
gem "paperclip" #Gem dùng chèm ảnh vào bài viết