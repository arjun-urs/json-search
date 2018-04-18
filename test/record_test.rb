require_relative 'test_helper'

class RecordTest < Minitest::Test
  def setup
    @attributes = {}.tap do |h|
      h['title'] = 'test'
      h['active'] = true
    end
    @class = JsonSearch::App
    @record = @class.new(@attributes)
  end

  def test_readable_attributes
    assert_equal 'test', @record.title
    assert @record.active
  end

  def test_primary_key
    assert_equal '_id', @class.primary_key
  end

  def test_contains
    assert @class.contains?(@attributes, 'title', 'test')
  end

  def test_any?
    assert @record.any?
    refute @class.new(nil).any?
  end

  def test_to_hash
    assert_equal @attributes, @record.to_hash
  end

  def test_label
    assert_equal 'App', @class.label
  end

  def test_source_defaults
    assert_equal nil, @record.attributes
    assert_equal nil, @record.all
  end
end
