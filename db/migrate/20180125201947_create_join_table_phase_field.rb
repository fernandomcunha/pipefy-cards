class CreateJoinTablePhaseField < ActiveRecord::Migration[5.1]
  def change
    create_join_table :phases, :fields do |t|
      t.index [:phase_id, :field_id]
      t.index [:field_id, :phase_id]
    end
  end
end
