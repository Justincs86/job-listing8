class Job < ApplicationRecord
  validates :title, presence: true

  validates :lower_wage_bound, presence: true
  validates :lower_wage_bound, numericality: { greater_than: 0 }
  validates :upper_wage_bound, presence: true

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  has_many :resumes

end
