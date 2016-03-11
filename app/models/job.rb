class Job < ActiveRecord::Base
    belongs_to :boats
    belongs_to :users
    
    validates_uniqueness_of :name
end
