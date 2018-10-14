# class CustomValidator < ActiveModel::Validator
#
#   def validate(record)
#     key_words = ["Won't Believe", "Secret", "Top
#     [number]", "Guess"]
#
#
#     # :title = record.title
#
#     if !record.title.nil?  #if there is no need to run validator
#       click_bait = key_words.any? { |word| record.title.include?(word) }
#
#         if click_bait
#           return true
#         else
#           record.errors.add(:title, "There is no Click-Bait")
#           return false
#         end
#
#       end
#
#    end
#
# end
