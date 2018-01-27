class AddApiIdToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :api_id, :string, null: false
  end
end
