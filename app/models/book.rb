class Book < ActiveRecord::Base
  has_many :theme_notes, dependent: :destroy

  validates :title, presence: true
  validates :page_count, numericality: { greater_than: 0 }
end