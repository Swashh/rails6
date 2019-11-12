# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, format: { with: /^(?!.*([^A-Za-z. ]|([ .]+\w([ .]+?|$))))([A-Z]\w+[ .]+)((\w{2,}[ .]*)*)/,
                                             multiline: true,
                                             message: "must contain two words(mininmum 2 symbols) and '.', first word start with capital letter" }
end
