class AddBranchLogToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :current_branch_log, :text
  end
end
