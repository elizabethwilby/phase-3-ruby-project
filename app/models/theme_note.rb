class ThemeNote < ActiveRecord::Base
  belongs_to :book

  validates :theme_name, presence: true
  validates :page_number, numericality: { greater_than: 0 }
  validate :page_number_within_book_length

  private

  def page_number_within_book_length
    return unless book && page_number

    if page_number > book.page_count
      errors.add(:page_number, "is longer than the book's page count of #{book.page_count}")
    end
  end
end