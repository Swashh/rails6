class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true, format: { with: /^(?!.*([^A-Za-z. ]|([ .]+\w([ .]+?|$))))([A-Z]\w+[ .]+)((\w{2,}[ .]*)*)/,
                                              multiline: true,
                                              message: "must contain two words(mininmum 2 symbols) and '.', first word start with capital letter" }
  validates :text, presence: true
end
