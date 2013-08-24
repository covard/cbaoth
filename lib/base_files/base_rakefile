require 'active_record'
require 'yaml'
require 'logger'
require 'database_cleaner'

CONFIG = YAML::load(File.open('config/database.yml'))

namespace :run do
  puts "todo: change the description of this for your needs."
  desc "Rakefile to run your app"
  task :import_mbm_data  do
    system "ruby process.rb"
  end
end

task :default => :migrate
namespace :db do
  desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end
 
  task :create do
    puts "----- Create DB -----"
    config = YAML::load(File.open('config/database.yml'))
    base = config['production'].dup
    base['database'] = 'postgres'
    db = ActiveRecord::Base.establish_connection base
    db.connection.create_database CONFIG["production"]["database"]
    db.disconnect! if db.connected?
 
    ActiveRecord::Base.establish_connection CONFIG["production"]
  end
 
  task :reset => :environment do
    puts "----- Reset DB -----"
    Rake::Task["db:truncate"].invoke('all')
    Rake::Task["db:migrate"].invoke
  end

  desc "Truncate all existing data"
  task :truncate, [:arg1] => :environment do |t, args|
    puts "*** Truncate - #{args[:arg1]}"
    if args[:arg1] =~ /all/i
      DatabaseCleaner.clean_with :truncation
    else
      DatabaseCleaner.clean_with :truncation, { only: [args[:arg1]] }
    end
  end

  namespace :test do
    desc "Migrate test DB"
    task :migrate do
      ActiveRecord::Base.establish_connection CONFIG["test"]
      ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
    end

    desc "Create test DB"
    task :create do
      puts "----- Create DB -----"
      config = YAML::load(File.open('config/database.yml'))
      config['test']['database'] = 'postgres'
      ActiveRecord::Base.establish_connection config['test']
      ActiveRecord::Base.connection.create_database CONFIG["test"]["database"]

      ActiveRecord::Base.establish_connection CONFIG["test"]
    end
  end

end
 
task :environment do
  ActiveRecord::Base.establish_connection CONFIG["production"]
  ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))
end