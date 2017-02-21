class Student < ApplicationRecord
  validates :name, presence: true
  validates :first, presence: true
  validates :rank, presence: true
  validates :code, presence: true
end
