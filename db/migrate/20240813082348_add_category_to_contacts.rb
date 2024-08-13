class AddCategoryToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :category, :string
  end
end
