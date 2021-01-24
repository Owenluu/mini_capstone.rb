class AddNameAndEmailToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :name, :string
    add_column :suppliers, :email, :string
  end
end
