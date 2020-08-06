class Url < ApplicationRecord
    belongs_to :user
    validates :link, presence: true
    validates :stub, presence: true
    validates :short, presence: true
  end