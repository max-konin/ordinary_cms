require 'rails/generators'

module OrdinaryCms
  class InstallGenerator < Rails::Generators::Base
    argument :name, type: :string, default: "AdminUser"
    def generate_activeadmin
      #generate("active_admin:install", name) unless ARGV.include? "--skip-activeadmin"
    end

  end
end