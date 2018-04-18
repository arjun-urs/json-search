require_relative 'test_helper'

class TicketTest < Minitest::Test
  def setup
    @class = JsonSearch::Ticket
  end

  def test_attributes_reader
    id = '436bf9b0-1147-4c0a-8439-6f79833bff5b'
    ticket = @class.find_by('_id', id)
  end

  def test_attributes_to_search
    assert_equal %w[_id url external_id created_at type subject description priority status submitter_id assignee_id organization_id tags has_incidents due_at via], @class.attributes
  end

  def test_belongs_to_organization
    assert @class.relationships.include?(:organization)
  end

  def test_class_label
    assert_equal 'Ticket', @class.label
  end
end
