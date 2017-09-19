source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Use Unicorn as the app server
gem 'unicorn'

gem "ransack", git: "https://github.com/activerecord-hackery/ransack"
gem 'acts_as_list'
#gem 'acts_as_list', git: 'https://github.com/swanandp/acts_as_list.git'
#gem 'acts_as_paranoid', github: 'ActsAsParanoid/acts_as_paranoid'
gem "paranoia", "~> 2.2"
gem 'activerecord-import'
gem 'enumerize'

###############################################################
# DB
###############################################################
gem 'mysql2'

###############################################################
# Background
###############################################################
#gem "resque", :require => 'resque/server'
#gem "resque-scheduler"
#gem 'daemon-spawn', :require => 'daemon_spawn'

###############################################################
# OTHER
###############################################################
# authorization
gem 'sorcery'
# inlet
gem "crypt", git: "https://github.com/singlebrook/crypt.git"
gem "zipruby"
gem "parallel"

# document
#group :doc do
#  # bundle exec rake doc:rails generates the API under doc/api.
#  gem 'sdoc', require: false
#end

# SQLの最適化案を提案してくれる
gem "bullet", group: "development"

# 多言語化対応
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x

###############################################################
# Monitoring
###############################################################
gem 'airbrake'

##############################################################
# SEED
# ############################################################
gem 'seed-fu', git: 'https://github.com/mbleigh/seed-fu'

##############################################################
# Utils
# ############################################################
gem 'kaminari'
gem 'nkrb'
gem 'whenever'
gem 'business_time'
