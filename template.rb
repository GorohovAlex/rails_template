# frozen_string_literal: true

require_relative 'helpers'

create_file '.ruby-version', '3.4.1', force: true

gem 'draper', '~> 4.0.4'
gem 'pundit', '~> 2.4'
gem 'rails-i18n', '~> 8.0.1'
gem 'tailwindcss-rails', '~> 4.0.0'
gem 'pagy', '~> 9.3.3'

# Admin panel
# gem 'activeadmin', '~> 3.2', '>= 3.2.5'
# gem 'activeadmin_addons', '~> 1.10', '>= 1.10.2'

# FrontEnd
gem 'haml-rails', '~> 2.1'
gem 'simple_form', '~> 5.3', '>= 5.3.1'
gem 'simple_form-tailwind', '~> 0.1.2'

gem_group :development, :test do
  gem 'bullet', '~> 8.0.1'
  gem 'factory_bot_rails', '~> 6.4.4'
  gem 'rspec-rails', '~> 7.1.1'
end

gem_group :development do
  gem 'bundle-audit', '~> 0.1.0', require: false
  gem 'fasterer', '~> 0.11.0', require: false
  gem 'i18n-tasks', '~> 1.0.14', require: false
  gem 'haml_lint', '~> 0.60.0', require: false
  gem 'rails_best_practices', '~> 1.23.2', require: false
  gem 'rubocop', '~> 1.71.2', require: false
  gem 'rubocop-performance', '~> 1.23.1', require: false
  gem 'rubocop-rspec', '~> 3.4', require: false
  gem 'lefthook', '~> 1.10.10', require: false
  gem 'database_consistency', '~> 2.0.4', require: false
  gem 'strong_migrations', '~> 2.2.0'
  gem 'annotaterb', '~> 4.13.0'
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

  application do
    <<~RUBY
      config.generators do |g|
        g.template_engine :haml
      end
    RUBY
  end

  git :init
  git add: '.'
  git commit: "-m 'Initial commit with template'"
end
