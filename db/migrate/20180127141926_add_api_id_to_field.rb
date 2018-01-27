class AddApiIdToField < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :api_id, :string, null: false
  end
end
