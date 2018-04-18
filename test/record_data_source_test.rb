require_relative 'test_helper'

class RecordDataSourceTest < Minitest::Test
  def setup
    @data_source = JsonSearch::RecordDataSource.new(model: 'user')
  end

  def test_primary_key
    assert_equal '_id', @data_source.primary_key
  end

  def test_attributes
    @data_source.stub :models_json_string, '[{ "title": "test" }]' do
      assert_equal %w[title], @data_source.attributes
    end
  end

  def test_all
    @data_source.stub :models_json_string, '[{ "title": "test" }]' do
      assert_equal [{ 'title' => 'test' }], @data_source.all
    end
  end
end
