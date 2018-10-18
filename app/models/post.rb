class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 12 }
  validates :summary, length: { maximum: 9 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
    unless self.title =~ /Won't Believe|Secret|Top \d|Guess/i
      errors.add(:title, "title is not clickbaity enough")
    end
  end
end
