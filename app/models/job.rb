class Job < ActiveRecord::Base
    belongs_to :boats
    belongs_to :users

    validates_uniqueness_of :name
    validates :cargo, length: { minimum: 50 }
    validates :cost, :numericality => { :greater_than => 1000 }
end
