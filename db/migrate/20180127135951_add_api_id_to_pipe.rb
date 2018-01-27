class AddApiIdToPipe < ActiveRecord::Migration[5.1]
  def change
    add_column :pipes, :api_id, :string, null: false
  end
end
