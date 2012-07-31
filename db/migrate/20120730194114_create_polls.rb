class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, :null => false
      t.string :edit_url, :null => false

      t.timestamps
    end
  end
end
