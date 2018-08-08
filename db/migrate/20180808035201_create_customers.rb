class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
