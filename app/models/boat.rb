class Boat < ActiveRecord::Base
    belongs_to :user
    has_many :jobs
    
    validates_uniqueness_of :name
    validates :cargo, length: { minimum: 50 }
end
