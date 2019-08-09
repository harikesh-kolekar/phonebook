module Background
class Backup
  def self.pg
  	 config   = Rails.configuration.database_configuration
    system "pg_dump -U #{config[Rails.env]["username"]} #{config[Rails.env]["database"]} > /tmp/pg_backup_#{Time.now.strftime("%d_%m_%Y_%H_%M")}"
  end
end
end
