class TravelJournal < ActiveRecord::Base
  belongs_to :user

  has_many :locations, dependent: :destroy

end
