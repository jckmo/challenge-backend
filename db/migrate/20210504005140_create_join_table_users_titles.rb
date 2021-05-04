class CreateJoinTableUsersTitles < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :titles do |t|
      t.references :users, foreign_key: true
      t.references :titles, foreign_key: true
    end
  end
end
