class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  belongs_to :page
end
