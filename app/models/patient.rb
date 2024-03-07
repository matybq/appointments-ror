class Patient < ApplicationRecord
  enum sex: { masculino: 0, femenino: 1 }

  validates :sex, inclusion: { in: sexes.keys }

  belongs_to :user
  has_many :appointments, dependent: :destroy

  before_create :random_id


  def age
    today = Date.today
    birthdate = self.dob
    age = today.year - birthdate.year - ((today.month > birthdate.month || (today.month == birthdate.month && today.day >= birthdate.day)) ? 0 : 1)
    age
  end

  private
  def random_id
    begin
     self.id = SecureRandom.random_number(1_000_000_000) 
    end while User.where(id: self.id).exists?
  end

end
