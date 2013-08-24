require 'spec_helper'

describe Cbaoth::Generator do
  before :all do
    FileUtils.mkdir_p("spec/testing_dir")
    Dir.chdir("spec/testing_dir")
    @generator = Cbaoth::Generator.new
  end

  describe 'methods' do
    it { should respond_to :init_variables }
    it { should respond_to :generate }
    it { should respond_to :create_dir_structure }
    it { should respond_to :generate_base_files }
    it { should respond_to :alert_user }
  end

  describe '#generate' do
    it 'throws an argument error if arguments are not passed' do
      expect { @generator.generate }.to raise_error(ArgumentError)
    end

    it 'generates a base ruby app' do
      n = nil
      @generator.generate "test", n
      Dir.chdir "test"
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

    it 'creates the log dir' do
      expect(Dir.exist?('log')).to be_true
    end
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

    describe 'git init' do
      it 'inits git' do
        n = ""
        @generator.generate "test", n
        Dir.chdir "test"
        expect(Dir.exist?('.git')).to be_true
      end
    end

    describe 'ignore git init' do
      it 'inits git' do
        n = "-g"
        @generator.generate "test", n
        Dir.chdir "test"
        expect(Dir.exist?('.git')).to be_false
      end
    end
  end
end