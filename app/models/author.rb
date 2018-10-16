class Author < ActiveRecord::Base
  validates :name, length: { minimum: 2 }, uniqueness: true
  validates :phone_number, length: { is: 10 }, uniqueness: true
end
