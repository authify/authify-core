module Authify
  module Core
    module Helpers
      module JWTSSL
        def private_key
          path = File.expand_path(CONFIG[:ssl][:private])
          OpenSSL::PKey::EC.new File.read(path)
        end

        def public_key
          path = File.expand_path(CONFIG[:ssl][:public])
          OpenSSL::PKey::EC.new File.read(path)
        end
      end
    end
  end
end
