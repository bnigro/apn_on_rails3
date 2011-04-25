require 'rails/generators/active_record'

# Generates the migrations necessary for APN on Rails.
# This should be run upon install and upgrade of the 
# APN on Rails gem.
# 
#   $ rails g apn_migrations

class ApnMigrationsGenerator < Rails::Generators::Base
  argument :name, :default => "migration"
  @timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
  include Rails::Generators::Migration
  
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end
  
  def self.next_migration_number(dirname)
    @timestamp = @timestamp.succ	
    @timestamp
  end
  
  def create_migrations
    migration_template '001_create_apn_devices.rb', 'db/migrate/create_apn_devices.rb'
    migration_template '002_create_apn_notifications.rb', 'db/migrate/create_apn_notifications.rb'
    migration_template '003_alter_apn_devices.rb', 'db/migrate/alter_apn_devices.rb'
    migration_template '004_create_apn_apps.rb', 'db/migrate/create_apn_apps.rb'
    migration_template '005_create_groups.rb', 'db/migrate/create_groups.rb'
    migration_template '006_alter_apn_groups.rb', 'db/migrate/alter_apn_groups.rb'
    migration_template '007_create_device_groups.rb', 'db/migrate/create_device_groups.rb'
    migration_template '008_create_apn_group_notifications.rb', 'db/migrate/create_apn_group_notifications.rb'
    migration_template '009_create_pull_notifications.rb', 'db/migrate/create_pull_notifications.rb'
    migration_template '010_alter_apn_notifications.rb', 'db/migrate/alter_apn_notifications.rb'
    migration_template '011_make_device_token_index_nonunique.rb', 'db/migrate/make_device_token_index_nonunique.rb'
    migration_template '012_add_launch_notification_to_apn_pull_notifications.rb', 'db/migrate/add_launch_notification_to_apn_pull_notifications.rb'
  end
  
end # ApnMigrationsGenerator