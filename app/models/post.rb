class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_must_be_clickbaity_enough

  @@clickbait = ["Won't Believe", "Secret", "Top", "Guess"]

  def title_must_be_clickbaity_enough
    if title.present? && !@@clickbait.any? {|x| title.include?(x)}
      errors.add(:title, "must be clickbait-y enough")
    end
  end
end
