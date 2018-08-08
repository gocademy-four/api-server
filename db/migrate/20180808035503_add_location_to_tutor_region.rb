class AddLocationToTutorRegion < ActiveRecord::Migration[5.2]
  def change
    add_column :tutor_regions, :location, :string
  end
end
