class ChangeColumnTypeToEnumInPatients < ActiveRecord::Migration[7.1]
  def change
    change_column :patients, :sex, :integer, using: 'sex::integer'
  end
end
