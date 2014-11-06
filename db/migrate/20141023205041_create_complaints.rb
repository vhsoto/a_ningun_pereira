class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title, default: ""
      t.text :body, default: ""

      t.timestamps
    end
  end
end
