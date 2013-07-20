require "ruby_app_generator/version"

module RubyAppGenerator
  class Generator
    def output(app_name)
      puts "File#dirname: #{File.dirname(__FILE__)}"
      puts "Dir#pwd: #{Dir.pwd}"
      generate_base_files app_name
    end

    def generate_base_files(app_name)
      puts
      puts "Generating ruby app #{app_name} in #{Dir.pwd}/#{app_name}"
    end
  end
end
