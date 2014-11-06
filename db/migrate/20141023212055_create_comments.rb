class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, default: ""
      t.references :complaint, index: true

      t.timestamps
    end
  end
end
