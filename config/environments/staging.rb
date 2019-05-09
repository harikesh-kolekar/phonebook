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


   # Expands the lines which load the assets
  config.assets.debug = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
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
  
  
  config.action_mailer.asset_host = "localhost:3000"

  config.default_content_type = "text/html"




  $gcm = GCM.new("AIzaSyBpYRrZq1e9H3hkHe9AQ3OynCHSKK-oW7c")
  $notification_key='APA91bHbNzqfWHytT8X4ezJ4Drbk-WWqJU4qiKSXVER9eOLBOOUyqPPzmfVD6h_b6TlNgx31Ocv1A-gBSEtFQWjIFgI-NMKu81Rh5QD6UAj85gdTOvrGlixanxS4sK1exAZe0ohZ7Pqh'
  $key_name = "notification_development"

  $notification_key_1='APA91bEL6cYWvNaG-BwykkGLwveFFm1f2qd4k8wlXbRO5mH2smexxLsIK7TyaXszEamnpAlNv_BwdJr1Ba4tF0GcDAG1bM7BvtwwEcuuIEWjsODDHAbkzS09IIO3dt0rCLwDMp9CIVAs'
  $key_name_1 = "notification_development_1"
  $notification_key_2='APA91bHcKucJ3riunfgKeAkNsT2y8phh6053YbiBcCj5hwSK68v-8yb_fEXdi4wXdhRXZOusypdLu8NLUsDrriD6kVS26o-ky2bCyx40uKpQChSbLZklOtEfPc0Mh-YmyHSYUFZ3kC4U'
  $key_name_2 = "notification_development_2"
  $notification_key_3='APA91bE0Ae6quqOBA6QI1HrH3QnX0L8QUgB4m_ajNK2MwClV-gITOiN1X4fGKPy4cJ_81CWNJcdGPlxS03mpnptuybe7oJ7t638TxqRkinjg2-pgjMZ7coueeLYw2N484QWZwKbj5QhB'
  $key_name_3 = "notification_development_3"
  $notification_key_4='APA91bGckjuPe2KEX2w2hRq1fvbShDNN6GEBwyl4sxONwKWT_0pQpXIR4GArnyx1bgpR4EOZzC6DfGMYqIPQyAeplrS7-vyBeBF8nBRemSODo_TsPxhpPLErVheyDpf2Kox_gG-E47RL'
  $key_name_4 = "notification_development_4"
  $notification_key_5='APA91bGfyzxRKHHP8TN8oV8O-9W5qeVZWB50CyyvTYvhHrrVc0VRItZP2OgvuNYkc4k6-Np5wtlF4uTjXJFxy4Ssu8JcVmiAdw4sZ7nPMYYh3u9cQIKwHEB68cw-1LWob1gC4ky2siUn'
  $key_name_5 = "notification_development_5"
  # response = $gcm.create(key_name: "notification_development",
                # project_id: "788763458333",
                # registration_ids:[cjCiEYvLWU0:APA91bGSgxwSqTVeby98YZCGTed7TgsQQHba8knXyXU8ERPANtDEP21ASNluBm8rpnOROCV1BYMma9PByIVn-Eyk_MwyAfexd80plTAcQNAq_ZmA9PmHHRk0UVudvwZI5vqCq9pgak-N])
#response = $gcm.remove("notification_development","788763458333","APA91bE54NetTHzd0gymSj51B_lnqvD4JJ3Ygnb9ciGOrtWJBBzOczXSfLGITpGGW7QEXMFGgAnJTPsqcSL0t_rsAiekODvZRSpTiCp-JTY2ZNvdXWnJOajwR3fEw97zuYTuJ294fA8D", ["gjCiEYvLWU0:APA91bGSgxwSqTVeby98YZCGTed7TgsQQHba8knXyXU8ERPANtDEP21ASNluBm8rpnOROCV1BYMma9PByIVn-Eyk_MwyAfexd80plTAcQNAq_ZmA9PmHHRk0UVudvwZI5vqCq9pgak-N"])
#notification_development_test = APA91bHJrKmFpM0CYgseCvmZXPfp-4Q1BKgsGttyRCd4dolF-UWLS9ovGhZPIa7VvnJf6zC--kKj2g_1sNrWbYzz1pLofExDWPoeaMP9RlEAVnmyGV3NDyu1kMnNhT6CydaScIkT340B
#$gcm.send_with_notification_key("APA91bE54NetTHzd0gymSj51B_lnqvD4JJ3Ygnb9ciGOrtWJBBzOczXSfLGITpGGW7QEXMFGgAnJTPsqcSL0t_rsAiekODvZRSpTiCp-JTY2ZNvdXWnJOajwR3fEw97zuYTuJ294fA8D",{data:{score: "10"},collapse_key: "admin_notification"})
#$gcm.create("notification_development_1", "788763458333", [""])
end
