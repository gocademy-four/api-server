class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone_number
      t.string :gender

      t.timestamps
    end
  end
end
