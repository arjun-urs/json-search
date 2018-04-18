require_relative 'lib/test_runner'

Dir['test/**_test.rb'].each do |test_file_path|
  run_test_from(test_file_path)
end
