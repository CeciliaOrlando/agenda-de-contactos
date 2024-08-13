class AddEmergencyNumberToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :emergency_number, :string
  end
end
