require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class FoodLogiQ < OmniAuth::Strategies::OAuth2
      option :name, "foodlogiq"

      option :client_options, {
        :site => 'http://localhost:3000',
        :authorize_url => 'http://localhost:3000/oauth/authorize',
        :token_url => 'http://localhost:3000/oauth/access_token'
      }

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'foodlogiq', 'FoodLogiQ'
