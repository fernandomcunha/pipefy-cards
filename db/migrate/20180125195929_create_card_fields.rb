class CreateCardFields < ActiveRecord::Migration[5.1]
  def change
    create_table :card_fields do |t|
      t.references :card, foreign_key: true, null: false, index: true
      t.references :field, foreign_key: true, null: false, index: true
      t.string :name, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
