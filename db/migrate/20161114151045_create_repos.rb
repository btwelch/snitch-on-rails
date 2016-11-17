class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.integer :server_id
      t.string :repo_name
      t.string :current_branch_name
      t.text :current_branch_status

      t.timestamps
    end
  end
end
