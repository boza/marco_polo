class User < ActiveRecord::Base
  include Clearance::User

  has_many :travel_journals, dependent: :destroy

end
