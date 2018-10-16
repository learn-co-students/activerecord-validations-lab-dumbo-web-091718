class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    # binding.pry
    if title == nil
      errors.add(:title, 'title cannot be nil!')
    elsif !["Won't Believe", "Secret", "Top [number]", "Guess"].any? { |substring| title.include?(substring) }
      errors.add(:title, 'needs to be clickbait')
    end
  end

end
