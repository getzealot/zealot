# frozen_string_literal: true

source 'https://gems.ruby-china.com'
ruby '>= 2.4.0', '< 2.7.0'

gem 'puma', '~> 4.1.1'
gem 'rails', '~> 6.0.0'
gem 'rails-i18n', '~> 6.0.0'
gem 'rake', '~> 12.3.2'

# DB & Cache
gem 'pg', '~> 1.1.4'
gem 'redis', '~> 4.1.2'

# API
gem 'active_model_serializers', '~> 0.10.10'
gem 'graphql', '~> 1.9.10'
gem 'rack-cors', '~> 1.0.3'

# View
## 生成 ios download plist
gem 'multi_xml'
## 模板引擎
gem 'jb', '~> 0.7.0'
gem 'slim-rails', '~> 3.2.0'
## 表单生成
gem 'simple_form', '~> 4.1'

# Model
## 生成友好 id
gem 'friendly_id'
## 数据分页
gem 'kaminari'
## 文件上传
gem 'carrierwave'
gem 'mini_magick'

# Helper
# HTTP 请求
gem 'http'
# 用户认证
gem 'devise', '~> 4.7.1'
gem 'omniauth-google-oauth2', '~> 0.8.0'
# Crontab
gem 'whenever', '~> 1.0.0', require: false
# # GEO 坐标计算
# gem 'haversine'

# Jenkins SDK
gem 'jenkins_api_client'
# 生成条形码/二维码
gem 'rqrcode'
# 个性化时间解析
gem 'chronic'
# 异步队列
gem 'sidekiq', '<= 6'
# 支持 sidekiq 使用界面
gem 'sinatra', '~> 2.0.7', require: false
# Mobile config
gem 'settingslogic'

# Assets
# gem 'js-routes'
gem 'sass-rails', '~> 6.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 4.0'

# 用于解析 ipa 和 apk 包
gem 'app-info', '~> 1.1.0', require: false

# 异常处理
gem 'exception_handler', '~> 0.8.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# graphiql web editor
gem 'graphiql-rails', '~> 1.7.0'

group :development do
  # 调试控制台
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # 断点调试器
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-bundler', require: false
  gem 'guard-migrate', require: false
  gem 'guard-rails', require: false
  gem 'guard-sidekiq', require: false
  gem 'terminal-notifier', require: false
  gem 'terminal-notifier-guard', require: false

  # IDE tools(VSCode)
  # gem "ruby-debug-ide"
  # gem "debase", '~> 0.2.3.beta2' # ruby 2.5 兼容有问题暂时关闭

  # 加速开发环境
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # rails 更友好错误输出
  gem 'awesome_print'
  gem 'better_errors'
end

group :development, :test do
  # gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'rubocop', '~> 0.45', require: false

  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-rescue'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]