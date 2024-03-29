source 'https://rubygems.org'

gem 'rails', '4.2.3'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem "autoprefixer-rails",       '~> 5.1.11'
gem 'slim-rails',        '~> 3.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'foundation-rails', '~> 5.5.3.2'
gem 'font-awesome-sass', '~> 4.4.0'
gem 'angular-rails-templates',  '~> 0.2.0'
gem 'ngannotate-rails', '~> 1.0.3'

source 'https://rails-assets.org' do
  gem 'rails-assets-angular',             '~> 1.4.7'
  gem 'rails-assets-angular-animate',     '~> 1.4.7'
  gem 'rails-assets-ui-router',           '~> 0.2.15'
  gem 'rails-assets-angular-translate',   '~> 2.7.2'
  gem 'rails-assets-angular-translate-once', '~> 1.0.1'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner', '~> 1.5.1'
  gem 'faker', '~> 1.5.0'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false,
    github: "seuros/capistrano-puma", branch: "master"
  gem 'capistrano-secrets-yml', '~> 1.0.0'
end

gem 'neo4j', '~> 5.2.10'
gem 'devise-neo4j'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'nokogiri'
gem 'gate', '~> 0.1.0'
gem 'responders'
gem 'sidekiq'
gem 'sinatra', require: nil
gem 'puma'
