# Standard Library Requirements
require 'json'
require 'digest/sha2'
require 'base64'

# External Requirements
require 'jwt'
require 'openssl'

module Authify
  module Core
    CONFIG = {
      ssl: {
        public:  ENV['AUTHIFY_PUBKEY_PATH'] || File.join('~', '.authify', 'ssl', 'public.pem'),
        private: ENV['AUTHIFY_PRIVKEY_PATH'] || File.join('~', '.authify', 'ssl', 'private.pem')
      },
      jwt: {
        issuer: ENV['AUTHIFY_JWT_ISSUER'] || 'My Awesome Company Inc.'
      }
    }
  end
end

require 'authify/core/version'
require 'authify/core/secure_hashing'
require 'authify/core/constants/jwt_scopes'
require 'authify/core/helpers/jwt_ssl'
