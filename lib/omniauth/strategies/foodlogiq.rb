require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class FoodLogiQ < OmniAuth::Strategies::OAuth2
      option :name, "foodlogiq"

      option :client_options, {
        :site => ENV['FOODLOGIQ_SITE'],
        :authorize_path => '/oauth/authorize',
        :token_path => '/oauth/access_token'
      }

      uid do 
        raw_info['email']
      end

      info do
        {
          'email' => raw_info['email'],
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'foodlogiq', 'FoodLogiQ'
