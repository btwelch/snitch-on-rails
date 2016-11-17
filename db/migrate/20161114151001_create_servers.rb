class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :server_name
      t.integer :server_order
      t.integer :server_group

      t.timestamps
    end
  end
end
