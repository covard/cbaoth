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
      vars = []
      vars = @generator.init_variables
      expect(vars.length).to eq 2
    end
  end

  describe '#create_dir_structure' do
    it { should respond_to :create_dir_structure }
    before { Dir.chdir('spec/testing_dir') }
    it 'creates the apps directory structure'

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