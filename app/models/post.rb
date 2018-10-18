require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    return false if !title
    if !title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
      errors.add(:title, "Not clickbaity enough")
    end
   end
 end
