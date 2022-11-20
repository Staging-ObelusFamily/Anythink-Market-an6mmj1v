require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AnythinkMarket
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.api_only = true

    # Allow codespace host
    config.hosts << ".anythink.market"
    config.hosts << ".#{ENV['GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN']}"

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
  end
end
