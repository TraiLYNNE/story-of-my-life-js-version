class EntrySerializer < ActiveModel::Serializer
  attributes :id, :time, :mood, :content
  
  belongs_to :page
end
