require_relative 'test_helper'

class UserTest < Minitest::Test
  def setup
    @class = JsonSearch::User
  end

  def test_find_user
    user = @class.find_by('_id', 1)
    assert_equal 1, user._id
  end

  def test_attributes_to_search
    assert_equal %w[_id url external_id name alias created_at active verified shared locale timezone last_login_at email phone signature organization_id tags suspended role], @class.attributes
  end

  def test_belongs_to_organization
    assert @class.relationships.include?(:organization)
  end

  def test_class_label
    assert_equal 'User', @class.label
  end
end
