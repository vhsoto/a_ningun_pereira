class AddUserToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :user_id, :integer
    add_index :complaints, :user_id
  end
end
