class Page < ApplicationRecord
  # Associations
  belongs_to :chapter

  has_many :entries
  has_many :tasks

  validates_presence_of :quote, :thank_you, :lesson_learned

  accepts_nested_attributes_for :entries, reject_if: proc { |att| att['content'].blank?}
  
  
  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |attribute|
      self.tasks.build(attribute)
    end
  end
  
  def date
    self.created_at.strftime("%A, %B %d")
  end

  def page_number
    self.created_at.yday
  end
  
  def self.random_quote
    quotes = self.all.map{|p| p.quote}
    l = quotes.length
    i = rand(0..l)
    return quotes[i]
  end
  
  
end
