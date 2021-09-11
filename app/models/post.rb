class Post < ApplicationRecord


  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait_validation

  def click_bait_validation
    if !:title.match?(/Won't Believe|Secret|Top \d*|Guess/)
      errors.add(:title, "Sorry you're title isn't clickbait-y enough")
    end
  end
end
