require_relative '../test_helper'

TestKlass = Class.new do
  include YoutubeDL::Support

  def executable_path
    usable_executable_path_for 'youtube-dl'
  end
end

describe YoutubeDL::Support do
  before do
    @klass = TestKlass.new
  end

  describe '#usable_executable_path' do
    it 'should not have a newline char in the executable_path' do
      assert_match(/youtube-dl\z/, @klass.executable_path)
    end
  end

  describe '#terrapin_line' do
    it 'should return a Terrapin::CommandLine instance' do
      assert_instance_of Terrapin::CommandLine, @klass.terrapin_line('')
    end

    it 'should be able to override the executable' do
      line = @klass.terrapin_line('hello', 'echo')
      assert_equal "echo hello", line.command
    end

    it 'should default to youtube-dl' do
      line = @klass.terrapin_line(@klass.quoted(TEST_URL))
      assert_includes line.command, "youtube-dl \"#{TEST_URL}\""
    end
  end

  describe '#quoted' do
    it 'should add quotes' do
      assert_equal "\"#{TEST_URL}\"", @klass.quoted(TEST_URL)
    end
  end

  describe '#which' do
    it 'should find a proper executable' do
      assert File.exists?(@klass.which('ls'))
    end
  end
end
