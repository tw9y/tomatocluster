require 'rake/testtask'

desc "Run specs"
Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

desc "Load stuff in IRB."
task :console do
	exec "irb -Ilib -rapp"
end
