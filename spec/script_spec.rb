# Spec helper (must include first to track code coverage with SimpleCov)
require File.expand_path('../support/spec_helper', __FILE__)

require File.expand_path('../../lib/dmorrill10-utils/script', __FILE__)

describe Script do
  before do
    @patient_class = Class.new do
      include Script

      $script_was_run = Class.new(RuntimeError)

      def initialize
      end

      def register_arguments
        super do |parser|
          yield parser
        end
      end

      def run(file_containing_this_class, arguments)
        run_script_if_run_as_script file_containing_this_class, arguments do
          raise $script_was_run
        end
      end

      def proper_usage?(parsed_arguments)
        true
      end
    end

    @patient = @patient_class.new
  end

  describe '#run_script_if_run_as_script' do
    it 'should do nothing if not run as a script' do
      @patient.run('not the file that was run', [])
    end
    describe 'should run if it was run as a script' do
      it 'when there are no mandatory arguments' do
        (->() { @patient.run($0, []) }).must_raise $script_was_run
      end
      it 'when all mandatory arguments are provided' do
        @patient.register_arguments do |parser|
          parser.desc 'A mandatory argument'
          parser.opt :mandatory, arg: '<mandatory>'
          parser.desc 'Optional argument'
          parser.opt :optional, arg: '[optional]'
        end
        @patient_class.send(:define_method, :proper_usage?) do |parsed_arguments|
          !parsed_arguments[:mandatory].nil?
        end
        (->() { @patient.run($0, %w{ --mandatory present! }) }).must_raise $script_was_run
      end
    end
  end
  describe 'raises an exception if' do
    it '#proper_usage? is not implemented' do
      @patient_class.send(:remove_method, :proper_usage?)
      (->() { @patient.run($0, []) }).must_raise Abstract::MethodNotImplemented
    end
  end
  it 'should print a usage information if mandatory arguments are not received' do
    @patient.register_arguments do |parser|
      parser.desc 'A mandatory argument'
      parser.opt :mandatory, arg: '<mandatory>'
    end
    @patient_class.send(:define_method, :proper_usage?) do |parsed_arguments|
      !parsed_arguments[:mandatory].nil?
    end
    (->() { @patient.run($0, []) }).must_output
  end
end
