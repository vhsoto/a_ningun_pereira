class AddPublicToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :public, :boolean, default: false
  end
end
