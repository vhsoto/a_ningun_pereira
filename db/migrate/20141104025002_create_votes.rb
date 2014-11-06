class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 0
      t.references :user, index: true
      t.references :complaint, index: true

      t.timestamps
    end
  end
end
