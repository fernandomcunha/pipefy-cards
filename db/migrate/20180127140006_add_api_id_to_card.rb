class AddApiIdToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :api_id, :string, null: false
  end
end
