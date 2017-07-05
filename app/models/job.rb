class Job < ApplicationRecord
  validates :title, presence: true

  validates :lower_wage_bound, presence: true
  validates :lower_wage_bound, numericality: { greater_than: 0 }
  validates :upper_wage_bound, presence: true

  scope :published, -> { where(:is_hidden => false) }
  scope :recent, -> { order("created_at DESC") }
end
