class Author < ActiveRecord::Base
  validates :name, uniqueness: true
end
