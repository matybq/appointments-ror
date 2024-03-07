class AddUserIdToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :user_id, :string
  end
end
