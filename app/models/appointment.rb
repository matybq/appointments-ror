class Appointment < ApplicationRecord

  belongs_to :user
  belongs_to :patient

  before_create :random_id

  private
  def random_id
    begin
     self.id = SecureRandom.random_number(1_000_000_000) 
    end while User.where(id: self.id).exists?
  end

end
