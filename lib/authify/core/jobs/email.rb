module Authify
  module Core
    module Jobs
      # A Resque job for sending email (using Pony)
      class Email
        @queue = :mailer
        def self.perform(to:, subject:, body: nil, html_body: nil, headers: nil)
          config = {
            to: to,
            from: CONFIG[:mail][:from],
            subject: subject,
            via_options: CONFIG[:mail][:server]
          }

          config[:headers]   = headers if headers
          config[:body]      = body if body
          config[:html_body] = html_body if html_body

          Pony.mail config
        end
      end
    end
  end
end
