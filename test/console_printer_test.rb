require_relative 'test_helper'

class ConsolePrinterTest < Minitest::Test
  class Printer
    extend JsonSearch::ConsolePrinter
  end

  def setup
    @record = JsonSearch::App.new(title: 'test', active: true)
  end

  def test_build_report_for
    lines = Printer.build_report_lines_for(@record)
    expected_report_lines = [
      'App',
      '---------------',
      'title                test',
      'active               true',
      ''
    ]
    assert_equal expected_report_lines, lines
  end
end
