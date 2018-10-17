class Post < ActiveRecord::Base
  CAT_OPTIONS = ["Fiction", "Non-Fiction"]
  TITLE_OPTIONS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  validates :title, presence: true, uniqueness: true
  validates_length_of :summary, :maximum => 250
  validates_length_of :content, :minimum => 250
  validates :category, presence: true, inclusion: CAT_OPTIONS
  validate  :is_clickbait?

  def is_clickbait?
    TITLE_OPTIONS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
