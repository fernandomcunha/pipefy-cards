class CreateJoinTablePipeField < ActiveRecord::Migration[5.1]
  def change
    create_join_table :pipes, :fields do |t|
      t.index [:pipe_id, :field_id]
      t.index [:field_id, :pipe_id]
    end
  end
end
