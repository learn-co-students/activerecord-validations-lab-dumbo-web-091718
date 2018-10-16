class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate  :clickbait?

  def clickbait?

    array = ["Won't Believe", "Secret", "Guess", "Top"]

    clickbait = []

    array.each do |string|
      if self.title && title.include?(string)
        clickbait << self
      end
    end

    if clickbait.empty? == true
      errors.add(:title, "not clickbait-y enough")
    end

    # else
    #   true
    # binding.pry
  end

end
