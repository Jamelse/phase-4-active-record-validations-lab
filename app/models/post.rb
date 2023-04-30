class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :is_post_clickbait
  

  def is_post_clickbait
    unless title =~ /Won't Believe|Secret|Top|Guess/
      errors.add(:title, "Not clickbait-y enough!")
    end
  end
end
