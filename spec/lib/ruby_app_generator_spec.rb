require 'spec_helper'

describe RubyAppGenerator::Generator do
  before :each do
    @generator = RubyAppGenerator::Generator.new
  end

  describe '#generate' do
    it { should respond_to :generate }
  end

  describe '#init_variables' do
    it { should respond_to :init_variables }
    it 'initializes and returns 2 instance variables' do
      vars = {}
      vars = @generator.init_variables
      expect(vars.length).to eq 2
    end
  end

  describe '#create_dir_structure' do
    it { should respond_to :create_dir_structure }
    previous_dir = Dir.pwd
    before do
      Dir.chdir("spec/testing_dir")
      dirs = @generator.init_variables
      @generator.create_dir_structure dirs[:working_directory]
    end

    it 'creates the bin dir' do
      expect(Dir.exist?("bin")).to be_true
    end

    it 'creates the lib dir' do
      expect(Dir.exist?('lib')).to be_true
    end

    after { Dir.chdir(previous_dir) }
  end

  describe '#generate_base_files' do
    it { should respond_to :generate_base_files }
    it 'creates a rakefile'

    it 'creates a gemfile'

    it 'creates a readmefile'
  end

  describe '#init_rspec' do
    it { should respond_to :init_rspec }
    it 'initializes respec'
  end

  describe '#init_guard' do
    it { should respond_to :init_guard }
    it 'initializes guard'
  end
  
end