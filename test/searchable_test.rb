require_relative 'test_helper'

class SearchableTest < Minitest::Test
  class SomeSearchable
    extend JsonSearch::Searchable
  end

  def test_interface
    assert_respond_to SomeSearchable, :all
    assert_respond_to SomeSearchable, :find
    assert_respond_to SomeSearchable, :find_by
    assert_respond_to SomeSearchable, :where
  end
end
