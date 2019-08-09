class Backup
  def self.pg
    system "sudo pg_dump -U user_name database_name > /tmp/pg_backup_#{Time.now}"
  end
end
