require "ruby_app_generator/version"

module RubyAppGenerator
  class Generator

    def generate app_name
      init_variables
    end

    def init_variables
      wd = Dir.pwd
      gem_dir = File.dirname(__FILE__)

      { working_directory: wd, gem_directory: gem_dir }
    end

    def create_dir_structure wd
      system "mkdir -p #{wd}/lib #{wd}/bin"
    end

    def generate_base_files(app_name)
      puts
      puts "Generating ruby app #{app_name} in #{Dir.pwd}/#{app_name}"
    end

    def init_rspec
      
    end

    def init_guard
      
    end

  end

end
