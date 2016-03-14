class Boat < ActiveRecord::Base
    belongs_to :user
    has_many :jobs
    has_many :relationships
    
    validates_uniqueness_of :name
    validates :location, inclusion: {in: ["London", "Oakland", "Long Beach", "New York", "Singapore", "Thailand", "Vietnam", "Albuquerque", "Hamburg", "Newcastle", "Marseille", "St. Tropez", "Cannes", "Rome"]}
end
