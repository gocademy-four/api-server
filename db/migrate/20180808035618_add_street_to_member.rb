class AddStreetToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :street, :text
  end
end
