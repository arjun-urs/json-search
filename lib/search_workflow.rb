require 'json'
require 'yaml'

module JsonSearch;end

CONSTANTS = YAML.load_file('conf/constants.yml')

require_relative 'json_search/record_data_source'
require_relative 'json_search/searchable'

require_relative 'json_search/models/app'
require_relative 'json_search/models/organization'
require_relative 'json_search/models/ticket'
require_relative 'json_search/models/user'

require_relative 'json_search/search_input'
require_relative 'json_search/console_printer'
require_relative 'json_search/search_workflow'
