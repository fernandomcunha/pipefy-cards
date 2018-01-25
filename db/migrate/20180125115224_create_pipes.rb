class CreatePipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pipes do |t|
      t.references :organization, foreign_key: true, index: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
