class Author < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 }, uniqueness: true
end
