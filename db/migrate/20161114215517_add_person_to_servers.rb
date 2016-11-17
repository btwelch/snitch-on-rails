class AddPersonToServers < ActiveRecord::Migration[5.0]
  def change
    add_column :servers, :person_id, :integer
  end
end
