module JsonSearch
  class App
    extend Searchable
    @@relationships = []

    def initialize(hash)
      @record = hash
    end

    def self.primary_key
      '_id'
    end

    def self.attributes
      source.attributes
    end

    def self.all
      source.all
    end

    def self.contains?(record, property, value)
      property_value = record.dig(property)
      if property_value.is_a?(Array)
        property_value.include?(value.to_s)
      else
        property_value.to_s == value.to_s
      end
    end

    def any?
      !@record.nil?
    end

    def to_hash
      @record || {}
    end

    def self.source
      RecordDataSource.new(model: to_s.downcase)
    end

    def self.belongs_to(entity_sym)
      @@relationships << entity_sym unless @@relationships.include?(entity_sym)
    end

    def self.relationships
      @@relationships
    end

    def related_entities
      self.class.relationships.map do |relationship|
        id = send("#{relationship}_id".to_sym)
        record_module_name = self.class.to_s.split('::').first
        relationship_class_name = record_module_name + '::' + relationship.capitalize.to_s
        Object.const_get(relationship_class_name).find(id)
      end
    end

    def method_missing(m, *args, &block)
      attr_name = m.to_s
      return nil unless @record.key?(attr_name)
      @record[attr_name]
    end

    def self.label
      self.to_s.split('::').last
    end
  end
end
