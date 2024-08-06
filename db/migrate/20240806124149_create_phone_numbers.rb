class CreatePhoneNumbers < ActiveRecord::Migration[7.1]
  def change
    create_table :phone_numbers do |t|
      t.references :contact, null: false, foreign_key: true
      t.string :number
      t.string :emergency_number

      t.timestamps
    end
  end
end
