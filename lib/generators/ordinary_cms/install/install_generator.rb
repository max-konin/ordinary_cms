require 'rails/generators'

module OrdinaryCms
  class InstallGenerator < Rails::Generators::Base
    source_root OrdinaryCms::Engine.root
    argument :name, type: :string, default: "AdminUser"

    def generate_activeadmin
      generate("active_admin:install", name) unless ARGV.include? "--skip-activeadmin"
    end

    def copy_mercury_config
      copy_file 'app/assets/javascripts/mercury.js'
    end

    def add_routes
      route %Q{mount Mercury::Engine => '/'}
      route %Q{mount OrdinaryCms::Engine => '/'}
    end

  end
end