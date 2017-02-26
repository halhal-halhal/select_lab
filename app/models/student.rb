class Student < ApplicationRecord
  validates :name, presence: true
  validates :first, presence: true
  validates :rank, presence: true


  VALID_CODE =  /1[34]+TI0[0-9][0-9]/
  validates :code, presence: true, format: {with: VALID_CODE}
end
