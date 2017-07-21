class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :quote
  
  has_many :chapters
  has_many :pages
end
