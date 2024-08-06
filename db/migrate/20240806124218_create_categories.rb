class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.references :contact, null: false, foreign_key: true
      t.boolean :family
      t.boolean :friend
      t.boolean :customer
      t.boolean :supplier

      t.timestamps
    end
  end
end
