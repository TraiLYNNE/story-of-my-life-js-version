class Entry < ApplicationRecord
  # Associations
  belongs_to :page, optional: true

  def time
    self.created_at.strftime("%H:%M")
  end
end
