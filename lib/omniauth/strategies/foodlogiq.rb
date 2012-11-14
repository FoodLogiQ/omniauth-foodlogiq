require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class FoodLogiQ < OmniAuth::Strategies::OAuth2
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
          'nickname' => raw_info['login'],
          'email' => email,
          'name' => raw_info['name'],
          'image' => raw_info['avatar_url'],
          'urls' => {
            'GitHub' => "https://github.com/#{raw_info['login']}",
            'Blog' => raw_info['blog'],
          },
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/user').parsed
      end

      def email
        raw_info['email'] || (email_access_allowed? ? emails.first : nil)
      end

      def emails
        access_token.options[:mode] = :query
        @emails ||= access_token.get('/user/emails').parsed
      end

      def email_access_allowed?
        options['scope'] && !(options['scope'] == 'public')
      end

    end
  end
end

OmniAuth.config.add_camelization 'foodlogiq', 'FoodLogiQ'
