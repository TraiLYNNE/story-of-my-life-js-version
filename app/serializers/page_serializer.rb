class PageSerializer < ActiveModel::Serializer
  attributes :id, :page_number, :date, :quote, :thank_you, :lesson_learned
  
  belongs_to :chapter
  
  has_many :entries
  has_many :tasks
end
