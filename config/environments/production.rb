Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # `config.assets.precompile` has moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)
  config.logger = Logger.new(STDOUT)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  # config.assets.precompile += %w( search.js )

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Disable automatic flushing of the log to improve performance.
  # config.autoflush_log = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  #Email
  config.action_mailer.default_url_options = { :host => 'phonebook-kolekar.rhcloud.com/' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => 'phonebook.department@gmail.com',
  :password             => 'departmentphonebook',
  :authentication       => 'login',
  :enable_starttls_auto => true  }
  
  
  config.action_mailer.asset_host = "phonebook-kolekar.rhcloud.com/"

  config.default_content_type = "text/html"


  #GSM Key
  $gcm = FCM.new("AAAA9BMu98o:APA91bHioubOYtHpYQ56Mb0pbsjrtDUm554u8_3xF3jf4G_R-Ec5rnlVQmo6p1joWJwjRngpLGOdLIJ57nKGYaZzaUo0htgZqLn9EiZOvgQ6N_Ja3Y1z_lwfuljDdp7p3BwrUvuqFlF4")
  $key_name = "notification_production"
  $notification_key='APA91bF_tfsLU7xpIU4wDhe_QqAn1JRhUnAGmgNsYzzUfOiUrHX__AmZRDgcwC2BEqGkJEVBBNGiLx_NdbAQPUhghXqwKXqhDnycqHEcAVgL8fZ9K1Ao08QxsgMTT_ZxonnihsodtHsv'
  
  $notification_key_1='APA91bHA-3HLSmeEp_6Yw3g0DoEd7-vDWOitluKhyBTRFRHqTOI3La7sA8kuSfMhaPDy20tnOzjV7xaOe2CrvtmaH2jLaDbfy8em8EYFxxTyMSeB3Ynx1Yz6IrkTAQ-Vo9ycDzbZ1rew'
  $key_name_1 = "notification_production_1"
  $notification_key_2='APA91bHuLHZ5lDWqQZMGSSbPWYD1U5SxxiqF3zZLDHiTWCy-DTDTpdiabvd2hTI4SO4jdkNDSARd633w6-3u3MtkjiVBH2ccbOXmyxiquZKAi-SytvPWh6vjmK0fs3SVK4CCBI8MuXrN'
  $key_name_2 = "notification_production_2"
  $notification_key_3='APA91bE5t0a77XdAt4Vp7FWZ7NDzSu1PHD759WL7lfqBgToSQMjKWgJsVGqVlcgxaZ8Gt5CgPAhwa_iwP2eRHkCLHwlLFyetSqQ8hHkxsSXnZydJUG7lIqNMvuBDod7zCC7gzGryOJma'
  $key_name_3 = "notification_production_3"
  $notification_key_4='APA91bHV9pcBjDoWmfp9n_7Ut9A4ODgy8LO0UojlB0SZM3r8NTNNmXRFOHiIBsZ57wSAH0s_L0t5sHgkrk5UWPn9UXyPnNz7VU2paHXSTBTH1l8XggB4y2zaLoDNTMquAPNtRUp3Il3z'
  $key_name_4 = "notification_production_4"
  $notification_key_5='APA91bFvGnwtf7-4nFORgaUarw41L1dOEvvVTGIQpkma5jnahZg23s5luNc6ohEo_Oxb0zy8xFWGH_5pD0ml4yKqaYpideCpjqQ21tetRZmd8XcOE5iXF3FuZLLqGJMh6olv1OWlF4fJ'
  $key_name_5 = "notification_production_5"
  end
