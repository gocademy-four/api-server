class RemovePasswordAddPasswordDigestToMember < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :password, :string
    add_column :members, :password_digest, :string
  end
end
