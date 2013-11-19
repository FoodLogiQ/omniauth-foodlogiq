require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class FoodLogiQ < OmniAuth::Strategies::OAuth2
      option :name, "foodlogiq"

      option :client_options, {
        :site => ENV['FOODLOGIQ_SITE'] || ENV['FOODLOGIQ_ID_SITE'],
        :authorize_path => '/oauth/authorize',
        :token_url => '/oauth/access_token'
      }

      uid do 
        raw_info['email']
      end

      info do
        {
          'email' => raw_info['email'],
          'firstName' => raw_info['firstName'],
          'lastName' => raw_info['lastName']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/user').parsed
      end
    end
    class FoodLogiQRegister < OmniAuth::Strategies::OAuth2
      option :name, "foodlogiqRegister"

      option :client_options, {
        :site => ENV['FOODLOGIQ_SITE'] || ENV['FOODLOGIQ_ID_SITE'],
        :authorize_path => '/oauth/authorize',
        :token_url => '/oauth/access_token',
        :register => true
      }

      uid do 
        raw_info['email']
      end

      info do
        {
          'email' => raw_info['email'],
          'firstName' => raw_info['firstName'],
          'lastName' => raw_info['lastName']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'foodlogiq', 'FoodLogiQ'
OmniAuth.config.add_camelization 'foodlogiqRegister', 'FoodLogiQRegister'
