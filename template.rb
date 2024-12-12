# frozen_string_literal: true

require_relative 'helpers'

create_file '.ruby-version', '3.3.6', force: true

gem 'haml-rails', '~> 2.1'
gem 'pundit', '~> 2.4'
gem 'rails-i18n', '~> 8.0.0'
gem 'tailwindcss-rails', '~> 3.0.0'

# Admin panel
# gem 'activeadmin', '~> 3.2', '>= 3.2.5'
# gem 'activeadmin_addons', '~> 1.10', '>= 1.10.2'

# FrontEnd
gem 'simple_form', '~> 5.3', '>= 5.3.1'
gem 'simple_form-tailwind', '~> 0.1.1'

gem_group :development, :test do
  gem 'bullet', '~> 8.0.0'
end

gem_group :development do
  gem 'bundle-audit', '~> 0.1.0', require: false
  gem 'fasterer', '~> 0.11.0', require: false
  gem 'i18n-tasks', '~> 1.0', require: false
  gem 'haml_lint', '~> 0.59.0', require: false
  gem 'rubocop', '~> 1.69', require: false
  gem 'rubocop-performance', '~> 1.23', require: false
  gem 'rubocop-rspec', '~> 3.2', require: false
  gem 'lefthook', '~> 1.9', require: false
  gem 'database_consistency', '~> 1.7.26', require: false
  gem 'strong_migrations', '~> 2.1'
  gem 'annotaterb', '~> 4.13'
end

after_bundle do
  rails_command 'tailwindcss:install'

  generate 'simple_form:tailwind:install'
  generate 'bullet:install'
  generate 'strong_migrations:install'

  # config_activeadmin
  config_rubocop
  config_lefthook

  generate 'pundit:install'

  git :init
  git add: '.'
  git commit: "-m 'Initial commit with template'"
end
