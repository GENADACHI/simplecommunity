class Comment < ApplicationRecord
  belongs_to :discussion
  belongs_to :member, default: -> { Current.member }
  has_many :answers
end
