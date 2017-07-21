class Book < ApplicationRecord
  # Associations
  belongs_to :user

  has_many :chapters
  has_many :pages, through: :chapters

  # Validations
  validates_presence_of :title, :quote

  # Instance Methods
  def author
    self.user.name
  end
end
