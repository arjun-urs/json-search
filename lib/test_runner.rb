def run_test_from(test_file_path)
  printf "-----------------\n"
  printf "Running test #{test_file_path}\n"
  printf `ruby "#{test_file_path}"`
  printf "\n"
end
