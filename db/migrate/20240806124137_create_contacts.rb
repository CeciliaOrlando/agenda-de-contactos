class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :nickname
      t.date :birthday
      t.string :email

      t.timestamps
    end
  end
end
