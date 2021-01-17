require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task default: [:test]

namespace :binaries do
  def get_binaries(version)
    puts 'Updating python script'
    system("wget -O ./vendor/bin/youtube-dl https://yt-dl.org/downloads/#{version}/youtube-dl")
  end

  desc 'Get latest binaries'
  task :latest do
    get_binaries('latest')
  end

  desc 'Get binaries for specific version (run with `rake binaries:version[2015.07.07]`)'
  task :version, [:ver] do |_t, a|
    get_binaries(a[:ver])
  end
end

__END__
# Version file
# If you are updating this code, make sure you are updating
# lib/youtube-dl/version.rb as well as the Rakefile.

module YoutubeDL
  # Semantic Version as well as the bundled binary version.
  # "(major).(minor).(teeny).(pre-release).(binary-version)"
  VERSION = '0.3.1.<%= version %>'.freeze
end
