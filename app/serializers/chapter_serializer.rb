class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :main_focus
  
  belongs_to :book
  
  has_many :pages
  has_many :important_dates
end
