require "ruby_app_generator/version"

module RubyAppGenerator
  
  class Generator

    def generate app_name
      vars = init_variables app_name
      create_app_name_dir app_name
      create_dir_structure vars[:working_directory]
      generate_base_files vars[:working_directory], vars[:gem_directory]
      alert_user app_name
    end

    def init_variables app_name
      wd = Dir.pwd + "/#{app_name}"
      gem_dir = File.dirname(__FILE__)

      { working_directory: wd, gem_directory: gem_dir }
    end

    def create_app_name_dir app_name
      puts "creating app '#{app_name}' folder"
      puts
      system "mkdir #{app_name}"
    end

    def create_dir_structure wd
      puts "creating base app dir structure"
      puts
      system "mkdir -p #{wd}/lib #{wd}/bin #{wd}/config #{wd}/db/migrate"
    end

    def generate_base_files wd, gem_dir
      puts "generating base files"
      puts
      base_files = gem_dir + "/base_files"
      system "cp #{base_files}/base_gemfile #{wd}/Gemfile"
      system "cp #{base_files}/base_rakefile #{wd}/Rakefile"
      system "cp #{base_files}/base_readme #{wd}/README.md"
      system "cp #{base_files}/base_database.yml #{wd}/config/database.yml"
    end

    def alert_user app_name
      puts
      puts "*" * 90
      puts "App created if you want to set up rspec and guard follow the instructions below:"
      puts "-" * 90
      puts "\t$ cd #{app_name}"
      puts "\t$ rspec --init"
      puts "\t$ guard init rspec"
      puts
      puts "That's it. Thanks for using ruby_app_generator."
      puts "Happy rubying =) - #{ENV["LOGNAME"]}"
    end

  end

end
