class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :supplier_id

      t.timestamps
    end
  end
end
