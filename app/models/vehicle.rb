class Vehicle < ActiveRecord::Base
  has_many :checklists
  has_many :notes
end
