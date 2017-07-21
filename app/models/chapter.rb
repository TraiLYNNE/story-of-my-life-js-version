class Chapter < ApplicationRecord
  # Associations
  belongs_to :book

  has_many :pages
  has_many :important_dates
  
  validates_presence_of :title, :main_focus

  accepts_nested_attributes_for :important_dates, reject_if: proc { |att| att['title'].blank?}
end
