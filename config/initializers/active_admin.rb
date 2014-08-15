ActiveAdmin.application.tap do |config|
  config.load_paths << "#{OrdinaryCms::Engine.root}/app/admin"
  config.load_paths <<  File.expand_path('app/admin', Rails.root)
end