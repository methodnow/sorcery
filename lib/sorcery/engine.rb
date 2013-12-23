require 'sorcery'
require 'rails'

module Sorcery
  # The Sorcery engine takes care of extending ActiveRecord (if used) and ActionController,
  # With the plugin logic.
  class Engine < Rails::Engine
    config.sorcery = ::Sorcery::Controller::Config

    initializer "extend Controller with sorcery" do |app|
      ActionController::API.send(:include, Sorcery::Controller)
      ActionController::API.helper_method :current_user
      ActionController::API.helper_method :logged_in?
    end

    rake_tasks do
      load "sorcery/railties/tasks.rake"
    end

  end
end
