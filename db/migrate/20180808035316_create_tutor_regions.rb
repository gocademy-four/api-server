class CreateTutorRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :tutor_regions do |t|
      # Note: The command below disrupts the migration process in PostgreSQL
      # t.references :Tutor, foreign_key: true

      t.timestamps
    end
  end
end
