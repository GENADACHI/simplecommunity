class Comment < ApplicationRecord
  belongs_to :discussion
  belongs_to :member
end
