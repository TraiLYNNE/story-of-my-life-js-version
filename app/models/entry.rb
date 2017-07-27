class Entry < ApplicationRecord
  # Associations
  belongs_to :page, optional: true

  def time
    self.created_at.strftime("%H:%M")
  end
  
  def next
    new_entry = self.page.entries.where("id > ?", id).first
    
    if new_entry
      new_entry
    else
      self.page.entries.first
    end
      
  end
end
