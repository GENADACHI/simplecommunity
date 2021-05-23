class Discussion < ApplicationRecord
    has_many :comments
    belongs_to :member, default: -> { Current.member }
end
