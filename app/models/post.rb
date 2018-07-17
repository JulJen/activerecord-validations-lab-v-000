class Post < Activ
  eRecord::Base
  validates :title, presence: true
end
