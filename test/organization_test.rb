require_relative 'test_helper'

class OrganizationTest < Minitest::Test
  def setup
    @class = JsonSearch::Organization
  end

  def test_class_label
    assert_equal 'Organization', @class.label
  end

  def test_attributes_to_search
    assert_equal %w[_id url external_id name domain_names created_at details shared_tickets tags], @class.attributes
  end
end
