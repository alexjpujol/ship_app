class User < ActiveRecord::Base
    
  has_many :boats
  has_many :jobs
  has_many :relationships
  has_one :profile, dependent: :destroy
    
    
    after_create do 
        Profile.create(user_id: self.id)
    end
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
end
