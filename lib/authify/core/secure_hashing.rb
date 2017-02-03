module Authify
  module Core
    module SecureHashing
      # Convert a string to a Base64 encoded version of itself
      # @return [String]
      def to_64(string)
        Base64.encode64(string).chomp.gsub("\n", '')
      end

      # Decode a Base64 encoded string
      # @return [String]
      def decode64
        Base64.decode64(string)
      end

      def to_hex(data)
        data.unpack('H*').first.chomp.gsub("\n", '')
      end

      def sha512(string)
        to_hex(Digest::SHA512.digest(string))
      end

      def salted_sha512(string, salt = nil)
        salt ||= rand(9**99).to_s[0...16]
        sha512(string + salt) + salt
      end

      def compare_salted_sha512(string, hashed_string)
        salt = hashed_string[-16..-1]
        salted_sha512(string, salt) == hashed_string
      end

      def peppered_sha512(seed, pepper = rand(9**99).to_s)
        # Run our string through 10 rounds of SHA512, each time "peppering" it with random data
        10.times do
          seed = sha512(seed + pepper)
        end
        seed
      end
    end
  end
end
