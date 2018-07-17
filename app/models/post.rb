class Post < ActiveRecord::Base
  validates :title, presence: true
  valifates :content, length: { minimum: 150 }
end
