class CustomValidator < ActiveModel::Validator

  def validate(record)
    key_words = ["Won't Believe", "Secret", "Top
    [number]", "Guess"]


    # :title = record.title

    if !record.title.nil?  #if there is no need to run validator
      click_bait = key_words.any? { |word| record.title.include?(word) }

        if click_bait
          return true
        else
          record.errors.add(:title, "There is no Click-Bait")
          return false
        end

      end

   end

end

class Post < ActiveRecord::Base

  validates :title, :content, :summary, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }


  validates_with CustomValidator



  # include ActiveModel::Validations
   # in config initialzer
   # libs

  # private
  #
  #  def click_indentifier
  #    viruses = ["Won't Believe", "Secret", "Top
  #    [number]", "Guess"]
  #
  #    :title.each do |title_content|
  #      viruses.each do |viruse|
  #        if
  #          title_content.include?(viruse)
  #          return true
  #        else
  #         return false
  #       end  #if
  #     end #do
  #    end #title do
  # end #def

end
