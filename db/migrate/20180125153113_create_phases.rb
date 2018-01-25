class CreatePhases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.string :name, null: false
      t.references :pipe, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
