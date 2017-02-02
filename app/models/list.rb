class List < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
