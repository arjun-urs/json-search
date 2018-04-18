require_relative 'test_helper'

class SearchInputTest < Minitest::Test
  def setup
    @search_input = JsonSearch::SearchInput.new(
      context: JsonSearch::User,
      term: '_id',
      value: 1
    )
  end

  def test_to_s
    assert_equal 'Searching users for _id with 1', @search_input.to_s
  end

  def test_build_from_user_input
    assert @search_input.class.respond_to?(:build_from_user_input)
  end

  def test_build_from_hash
    search_input = JsonSearch::SearchInput.build_from_hash(
      context: JsonSearch::User,
      term: '_id',
      value: 1
    )
    assert_equal 1, search_input.value
    assert_equal '_id', search_input.term
    assert_equal JsonSearch::User, search_input.context
  end

  def test_models_list
    assert_equal [JsonSearch::User, JsonSearch::Ticket, JsonSearch::Organization], JsonSearch::SearchInput::MODELS
  end
end
