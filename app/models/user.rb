class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :appointments, dependent: :destroy

  before_create :random_id


  private
  def random_id
    begin
     self.id = SecureRandom.random_number(1_000_000_000) 
    end while User.where(id: self.id).exists?
  end
    
end
