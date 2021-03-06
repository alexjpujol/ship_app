class Boat < ActiveRecord::Base
    belongs_to :user
    has_many :jobs
    has_many :relationships
    
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"},
    :default_url => "/images/:style/missing.jpg"
    
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    validates_uniqueness_of :name
    validates :location, inclusion: {in: ["London", "Oakland", "Long Beach", "New York", "Singapore", "Thailand", "Vietnam", "Albuquerque", "Hamburg", "Newcastle", "Marseille", "St. Tropez", "Cannes", "Rome"]}
end
