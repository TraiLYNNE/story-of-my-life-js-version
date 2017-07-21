class Task < ApplicationRecord
  # Associations
  belongs_to :page, optional: true
end
