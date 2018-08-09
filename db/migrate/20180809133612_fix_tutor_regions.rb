require_relative '20180808035316_create_tutor_regions'

class FixTutorRegions < ActiveRecord::Migration[5.2]
  def change
    revert CreateTutorRegions

    create_table :tutor_regions do |t|
      t.references :tutor, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
