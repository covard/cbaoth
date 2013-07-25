require 'spec_helper'

describe Cbaoth::Generator do
  before :all do
    FileUtils.mkdir_p("spec/testing_dir/test")
    Dir.chdir("spec/testing_dir/test")
  end
  before :each do
    @generator = Cbaoth::Generator.new
  end

  describe '#generate' do
    it { should respond_to :generate }
  end

  describe '#init_variables' do
    it { should respond_to :init_variables }
    it 'initializes and returns 2 instance variables' do
      vars = {}
      vars = @generator.init_variables 'test'
      expect(vars.length).to eq 2
    end
  end

  describe '#create_dir_structure' do
    it { should respond_to :create_dir_structure }
    previous_dir = Dir.pwd
    before do
      # Dir.chdir("spec/testing_dir/test")
      dirs = @generator.init_variables 'test'
      @generator.create_dir_structure dirs[:working_directory]
    end

    it 'creates the bin dir' do
      expect(Dir.exist?("bin")).to be_true
    end

    it 'creates the lib dir' do
      expect(Dir.exist?('lib')).to be_true
    end

    it 'creates the config dir' do
      expect(Dir.exist?('config')).to be_true
    end

    it 'creates the db dir' do
      expect(Dir.exist?('db')).to be_true
    end

    it 'creates the db/migrate dir' do
      expect(Dir.exist?('db/migrate')).to be_true
    end

    # after { Dir.chdir(previous_dir) }
  end

  describe '#generate_base_files' do
    it { should respond_to :generate_base_files }
    before { 
      wd = Dir.pwd
      @generator.generate_base_files wd, "../../../" 
    }
    it 'creates a rakefile' do
      expect(File.exist?("Rakefile")).to be_true
    end

    it 'creates a gemfile' do
      expect(File.exist?("Gemfile")).to be_true
    end

    it 'creates a readmefile' do
      expect(File.exist?("README.md")).to be_true
    end

    it 'creates a database.yml file' do
      expect(File.exist?("config/database.yml")).to be_true
    end
  end

  describe '#alert_user' do
    it { should respond_to :alert_user }
  end
  
end