module JsonSearch
  module Searchable
    def find(id)
      find_by(primary_key, id)
    end

    def find_by(property, value)
      record = all.detect do |el|
        contains?(el, property, value)
      end
      new(record)
    end

    def all
      raise "Searchable#all method is not implemented"
    end

    def contains?(record, property, value)
      raise "Searchable#contains? method is not implemented"
    end

    def where(property, value)
      all.map do |el|
        new(el) if contains?(el, property, value)
      end.compact
    end
  end
end
