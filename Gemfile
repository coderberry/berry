source "https://rubygems.org"

ruby file: ".ruby-version"

gem "bootsnap", require: false
gem "commonmarker", "~> 1.0"
gem "honeybadger", "~> 5.8"
gem "inline_svg", "~> 1.9"
gem "jbuilder"
gem "lookbook", "~> 2.2"
gem "markdown-rails", "~> 2.1"
gem "meta-tags", "~> 2.20"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "redis", ">= 4.0.1"
gem "rouge", "~> 4.2"
gem "sitemap_generator", "~> 6.3"
gem "sitepress-rails", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "view_component", "~> 3.11"
gem "view_component-contrib", "~> 0.2.2"
gem "vite_rails", "~> 3.0"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "pry-byebug", "~> 3.10"
  gem "pry-rails", "~> 0.3.9"
end

group :development do
  gem "appmap", "~> 1.0", require: ENV["APPMAP"] == "true"
  gem "erb_lint", "~> 0.5.0"
  gem "standard", "~> 1.35"
  gem "standard-rails", "~> 1.0"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
