module JsonSearch
  class RecordDataSource
    def initialize(model:)
      @model = model
    end

    def primary_key
      '_id'
    end

    def all
      JSON.parse(models_json_string)
    end

    def attributes
      all.first.keys
    end

    private

    def models_json_string
      File.read(json_data_file_path)
    end

    def json_data_file_path
      File.dirname(__FILE__) + "/data/#{model_class}s.json"
    end

    def model_class
      @model.to_s.split('::').last
    end
  end
end
