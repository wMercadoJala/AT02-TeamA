require_relative 'base_class_for_data_classes'

class Stories < BaseClassForDataClasses
  attr_accessor :created_at,
                :current_state,
                :id,
                :kind,
                :labels,
                :name,
                :owner_ids,
                :project_id,
                :requested_by_id,
                :story_type,
                :updated_at,
                :url

  def initialize (values = {})
    super values
  end
  def self.get_parser_project(string)
    object_json = DataHelper.parse_json(string)
    result = DataHelper.rehash_to_symbol_keys(object_json)
    stories = Stories.new(result)
    stories
  end

end