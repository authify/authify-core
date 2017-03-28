module Authify
  module Core
    module Jobs
      # A Resque job for sending email (using Pony)
      class Email
        @queue = :mailer

        # Used by Resque to send email
        def self.perform(to, subject, opts = {})
          # Ensure opts keys are symbols
          opts = opts.each_with_object({}) { |(k, v), h| h[k.intern] = v }

          config = {
            to: to,
            from: CONFIG[:mail][:from],
            subject: subject,
            via_options: CONFIG[:mail][:server]
          }

          config[:headers]   = opts[:headers] if opts[:headers]
          config[:body]      = opts[:body] if opts[:body]
          config[:html_body] = opts[:html_body] if opts[:html_body]

          Pony.mail config
        end
      end
    end
  end
end
