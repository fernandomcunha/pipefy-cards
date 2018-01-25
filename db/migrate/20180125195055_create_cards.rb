class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.references :phase, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
