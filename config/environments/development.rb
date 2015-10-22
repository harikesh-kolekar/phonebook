Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  $gcm = GCM.new("AIzaSyBpYRrZq1e9H3hkHe9AQ3OynCHSKK-oW7c")
  $notification_key='APA91bHbNzqfWHytT8X4ezJ4Drbk-WWqJU4qiKSXVER9eOLBOOUyqPPzmfVD6h_b6TlNgx31Ocv1A-gBSEtFQWjIFgI-NMKu81Rh5QD6UAj85gdTOvrGlixanxS4sK1exAZe0ohZ7Pqh'
  $key_name = "notification_development"
  # response = $gcm.create(key_name: "notification_development",
                # project_id: "788763458333",
                # registration_ids:[cjCiEYvLWU0:APA91bGSgxwSqTVeby98YZCGTed7TgsQQHba8knXyXU8ERPANtDEP21ASNluBm8rpnOROCV1BYMma9PByIVn-Eyk_MwyAfexd80plTAcQNAq_ZmA9PmHHRk0UVudvwZI5vqCq9pgak-N])
#response = $gcm.remove("notification_development","788763458333","APA91bE54NetTHzd0gymSj51B_lnqvD4JJ3Ygnb9ciGOrtWJBBzOczXSfLGITpGGW7QEXMFGgAnJTPsqcSL0t_rsAiekODvZRSpTiCp-JTY2ZNvdXWnJOajwR3fEw97zuYTuJ294fA8D", ["gjCiEYvLWU0:APA91bGSgxwSqTVeby98YZCGTed7TgsQQHba8knXyXU8ERPANtDEP21ASNluBm8rpnOROCV1BYMma9PByIVn-Eyk_MwyAfexd80plTAcQNAq_ZmA9PmHHRk0UVudvwZI5vqCq9pgak-N"])
#notification_development_test = APA91bHJrKmFpM0CYgseCvmZXPfp-4Q1BKgsGttyRCd4dolF-UWLS9ovGhZPIa7VvnJf6zC--kKj2g_1sNrWbYzz1pLofExDWPoeaMP9RlEAVnmyGV3NDyu1kMnNhT6CydaScIkT340B
#$gcm.send_with_notification_key("APA91bE54NetTHzd0gymSj51B_lnqvD4JJ3Ygnb9ciGOrtWJBBzOczXSfLGITpGGW7QEXMFGgAnJTPsqcSL0t_rsAiekODvZRSpTiCp-JTY2ZNvdXWnJOajwR3fEw97zuYTuJ294fA8D",{data:{score: "10"},collapse_key: "admin_notification"})
end
