# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true, format: { with: /^(?!.*([^A-Za-z. ]|([ .]+\w([ .]+?|$))))([A-Z]\w+[ .]+)((\w{2,}[ .]*)*)/,
                                              multiline: true,
                                              message: "must contain two words(minimum 2 symbols) and '.', first word start with capital letter" }
  validates :text, presence: true
end
