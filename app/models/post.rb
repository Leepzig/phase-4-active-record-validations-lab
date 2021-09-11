class Post < ApplicationRecord


  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validate :click_bait_validation

  def click_bait_validation
    test_title = :title.class
    title_bool = :title.match?(/Won't Believe|Secret|Top \d*|Guess/)
    byebug
    if :title.match?(/Won't Believe|Secret|Top \d*|Guess/)
      errors.add(:title, "Sorry your title isn't clickbait-y enough")
    end
  end

  # def click_bait_validation
  #   click_bait = ["Won't Believe","Secret","Top[number]","Guess"]
  #   if click_bait.none? {| phrase | :title.match?(phrase)  }
  #     errors.add(:title, "title isn't clickbait-y enough")
  #   end
  # end
end
