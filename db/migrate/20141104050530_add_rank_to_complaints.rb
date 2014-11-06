class AddRankToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :rank, :float
  end
end
