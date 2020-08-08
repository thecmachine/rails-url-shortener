class Url < ApplicationRecord
    belongs_to :user
    validates :link, presence: true
    validates :short, presence: true
  end