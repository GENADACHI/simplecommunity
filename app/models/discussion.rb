class Discussion < ApplicationRecord
    has_many :comments
    belongs_to :member
end
