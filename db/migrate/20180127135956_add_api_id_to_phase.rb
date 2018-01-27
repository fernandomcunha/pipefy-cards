class AddApiIdToPhase < ActiveRecord::Migration[5.1]
  def change
    add_column :phases, :api_id, :string, null: false
  end
end
