class Breed < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, allow_blank: false
  has_many :assignments, as: :assignable, dependent: :destroy
  has_many :tags, through: :assignments, source: :assignee, source_type: 'Tag'


  # def tags=(values)
  #   # unless it's an array of tags
  #   values_class = values.map(&:class).compact.first
  #   unless values_class == Tag
  #     if [ActiveSupport::HashWithIndifferentAccess, Hash].include? values_class
  #       values.map! do |v|
  #         Tag.find_by(v) || Tag.new(v)
  #       end
  #     else
  #       errors.add(:base, "Not a valid tag type")
  #       raise ActiveRecord::RecordInvalid
  #     end
  #   end
  #   values.each do |v|
  #     self.assignments.build(assignee: v)
  #   end
  #   super(values)
  # end

  def self.convert_params(params)
    debugger
    if params.keys.include?("tags")
      # allow either an array of strings or hashes to be passed in
      if params["tags"].map(&:class).compact.first == String
        tag_params = params["tags"].map{|t| {label: t} }
      else 
        tag_params = params["tags"]
      end
    end
    # find or initialize the tags
    tags = tag_params.map{ |tp| Tag.find_by(tp) || Tag.new(tp) }
    params.except(:tags).merge(tags: tags)
  end

end
