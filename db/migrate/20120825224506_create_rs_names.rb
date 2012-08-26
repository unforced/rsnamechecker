class CreateRsNames < ActiveRecord::Migration
  def change
    create_table :rs_names do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
