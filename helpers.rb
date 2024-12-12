# frozen_string_literal: true

def config_rubocop
  config_path = File.expand_path('lib/.rubocop.yml', __dir__)
  target_path = File.join(Dir.pwd, '.rubocop.yml')
  FileUtils.cp(config_path, target_path, preserve: true)
end

def config_lefthook
  run 'bundle exec lefthook install'

  config_path = File.expand_path('lib/lefthook.yml', __dir__)
  target_path = File.join(Dir.pwd, 'lefthook.yml')
  FileUtils.cp(config_path, target_path, preserve: true)
end

# def config_activeadmin
#   manifest_file = 'app/assets/config/manifest.js'
#   unless File.exist?(manifest_file)
#     create_file manifest_file, <<~JS
#       //= link_tree ../images
#       //= link_directory ../javascripts .js
#       //= link_directory ../stylesheets .css
#     JS
#   end

#   generate 'activeadmin_addons:install'
#   generate 'active_admin:install User'
# end
