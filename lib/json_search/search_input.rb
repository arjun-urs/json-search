module JsonSearch
  class SearchInput
    MODELS = [User, Ticket, Organization].freeze
    attr_reader :context, :term, :value

    def initialize(context:, term:, value:)
      @context = context
      @term = term
      @value = value
    end

    def search
      context.where(term, value)
    end

    def self.build_from_user_input
      printf CONSTANTS['options']
      model_class = MODELS[gets.chomp.to_i - 1]
      printf CONSTANTS['search_term']
      attr_name = gets.chomp
      printf CONSTANTS['search_value']
      attr_value = gets.chomp
      new(context: model_class, term: attr_name, value: attr_value)
    end

    def self.build_from_hash(context:, term:, value:)
      new(context: context, term: term, value: value)
    end

    def to_s
      "Searching #{context.label.downcase}s for #{term} with #{value}"
    end
  end
end
