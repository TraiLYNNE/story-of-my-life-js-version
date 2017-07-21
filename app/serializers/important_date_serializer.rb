class ImportantDateSerializer < ActiveModel::Serializer
  attributes :id, :title, :date
  
  belongs_to :chapter
end
