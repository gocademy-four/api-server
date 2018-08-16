class CreateTeachedlessons < ActiveRecord::Migration[5.2]
  def change
    create_table :teachedlessons do |t|
      t.integer :price_per_hour
      t.references :tutor, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
