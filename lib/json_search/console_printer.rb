module JsonSearch
  module ConsolePrinter
    def print(record)
      printf build_report_lines_for(record).join("\n")
    end

    def build_report_lines_for(record)
      report = []
      report << record.class.label
      report << '---------------'
      record.to_hash.each do |attr_name, attr_value|
        report << format('%-20s %s', attr_name, attr_value)
      end
      report << ''
      report
    end
  end
end
