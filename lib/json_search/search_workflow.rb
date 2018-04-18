module JsonSearch
  class SearchWorkflow
    extend ConsolePrinter

    def self.print_welcome_msg
      printf CONSTANTS['welcome_message']
    end

    def self.print_next_cmd_message
      printf CONSTANTS['command_message']
    end

    def self.print_exit_message
      printf CONSTANTS['exit_message']
    end

    def self.run_search
      user_input = SearchInput.build_from_user_input
      printf user_input.to_s + "\n"
      search_results = user_input.search
      if search_results.any?
        search_results.each do |search_result|
          print(search_result)
          search_result.related_entities.each do |entity|
            print(entity)
          end
        end
      else
        printf CONSTANTS['no_result_found']
      end
    end

    def self.print_searchable_fields
      SearchInput::MODELS.each do |model_class|
        printf "#{model_class.label}: #{model_class.attributes.join(', ')}\n"
      end
    end

    def self.read_user_input
      gets.chomp
    end

    def self.run
      print_welcome_msg
      next_cmd = read_user_input
      while next_cmd != 'quit'
        print_next_cmd_message
        next_cmd = read_user_input
        case next_cmd
        when '1'
          run_search
        when '2'
          print_searchable_fields
        when 'quit'
          print_exit_message
          exit
        end
      end
    end
  end
end
