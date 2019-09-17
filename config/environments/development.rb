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




  $gcm = FCM.new("AAAA9BMu98o:APA91bHioubOYtHpYQ56Mb0pbsjrtDUm554u8_3xF3jf4G_R-Ec5rnlVQmo6p1joWJwjRngpLGOdLIJ57nKGYaZzaUo0htgZqLn9EiZOvgQ6N_Ja3Y1z_lwfuljDdp7p3BwrUvuqFlF4")
  $notification_key='APA91bGLHdQ2WRPMTMBWSrjADsWjaxNqxJj6bzJpTCmJUXgCDelnMwT2qMfCTM-j_W9JQeushFjcKMUtqJeTCLN4fvgHQTmBmtvZUDsHfEkk0c_t7WyMXiZOZ9MXPFqZc8ABnDSavFPN'
  $key_name = "notification_development"

  $notification_key_1='APA91bG0gShL2B8VeSyBBOaExnIrZ0OzRJhKAtlUfdXKO8WO9EvSX7KWMiAM6700C5PIqPtlT7fNUfLomBuFumOsbRBHEBQq-raNmrQ3bCzLCX_ixHYVWh97WD056yqqGJ1QTSUfOUFA'
  $key_name_1 = "notification_development_1"
  $notification_key_2='APA91bECR9CwlotJDMcLpxjfSkJ8bDMeTXJFBhrwW91iwcKsbZcc3z-Cg6djdDR6dincN8472136a73Occ61F8FIAx5PJmAvp-1otDuaenTjR6fbdWIpMtc8lchXMYglXv1mi_FPnK7s'
  $key_name_2 = "notification_development_2"
  $notification_key_3='APA91bEWBJdUTeEu4yCeZ14kC2ijlxk9z-MDAhkHseCqN5RO7VCawjqT94JoZikxdq8LsP8w1BSlgqOan1IT8CuZ4T2AohO3F33PHvsEggUdEWEoSAKd4nTSNJYY5hl7NatK1cymPuOC'
  $key_name_3 = "notification_development_3"
  $notification_key_4='APA91bGGPsjUB5HfPp_x2kAmQjZhlrforV8QsxlIIkG-KXjxFeYpsdC_r5-kIdafap37QDF2PmjbRKWiPwZ9dai4lzV2SM4daSWLuRpfzIwzB1SbkxuS8_OhoATSvn2to4VMI0NbUcaF'
  $key_name_4 = "notification_development_4"
  $notification_key_5='APA91bGpmI3avK6I0EXOWvQLrErI5Dr11oLS_wPsR0XL9uirYUZCibNkZ8DhkoFnpPWTXW3F_ZIA7mk0O8vGIZkVLnRCyPwJ6eSqz4Sgvd54miBOijE-fEkXjMNwGJEXvIzddx7HlFtZ'
  $key_name_5 = "notification_development_5"
  # key = ["notification_production", "notification_production_1", "notification_production_2", "notification_production_3", "notification_production_4", "notification_production_5"]
  # key.each  do |k|
  #   params = {key_name: k, project_id: "1048293865418", registration_ids:["cOHPlMJ_8LE:APA91bGZp6U_VTStskbEIJFMojVvRSE91qN3ua37UfaL_03gZLX1lyjmpDobk8iRZAZHomw11MimZoUVvmR5j493rZpsC2SRfjuruIf9io4Ts_-VWUEFRjgSw98toH7lLKSQ__2VOQTX"]}
  #   response = $gcm.create(*params.values)
  #   p response
  # end
#response = $gcm.remove("notification_development","788763458333","APA91bE54NetTHzd0gymSj51B_lnqvD4JJ3Ygnb9ciGOrtWJBBzOczXSfLGITpGGW7QEXMFGgAnJTPsqcSL0t_rsAiekODvZRSpTiCp-JTY2ZNvdXWnJOajwR3fEw97zuYTuJ294fA8D", ["gjCiEYvLWU0:APA91bGSgxwSqTVeby98YZCGTed7TgsQQHba8knXyXU8ERPANtDEP21ASNluBm8rpnOROCV1BYMma9PByIVn-Eyk_MwyAfexd80plTAcQNAq_ZmA9PmHHRk0UVudvwZI5vqCq9pgak-N"])
#notification_development_test = APA91bHJrKmFpM0CYgseCvmZXPfp-4Q1BKgsGttyRCd4dolF-UWLS9ovGhZPIa7VvnJf6zC--kKj2g_1sNrWbYzz1pLofExDWPoeaMP9RlEAVnmyGV3NDyu1kMnNhT6CydaScIkT340B
# $gcm.send_with_notification_key("APA91bGpmI3avK6I0EXOWvQLrErI5Dr11oLS_wPsR0XL9uirYUZCibNkZ8DhkoFnpPWTXW3F_ZIA7mk0O8vGIZkVLnRCyPwJ6eSqz4Sgvd54miBOijE-fEkXjMNwGJEXvIzddx7HlFtZ",{data:{score: "10"},collapse_key: "admin_notification"})
#$gcm.create("notification_development_1", "788763458333", [""])
end
