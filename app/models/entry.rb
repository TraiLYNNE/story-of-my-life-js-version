class Entry < ApplicationRecord
  # Associations
  belongs_to :page, optional: true

  def time
    self.created_at.strftime("%H:%M")
  end
  
  def next
    next_entry = self.page.entries.where("id > ?", id).first
    
    if next_entry
      next_entry
    else
      self.page.entries.first
    end
      
  end
  
  def prev
    prev_entry = self.page.entries.where("id < ?", id).order('id desc').first
    
    if prev_entry
      prev_entry
    else
      self.page.entries.last
    end
  end
end
