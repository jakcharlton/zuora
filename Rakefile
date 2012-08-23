require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList['specs/*_spec.rb','specs/scenarios/*_spec.rb']
  t.verbose = true
end

Rake::TestTask.new('scenario') do |t|
  t.libs.push 'lib'
  t.test_files = FileList['specs/scenarios/*_spec.rb']
  t.verbose = true
end

task :default => :test

