class AddUserIdToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :user_id, :string
    add_column :appointments, :patient_id, :string
  end
end
