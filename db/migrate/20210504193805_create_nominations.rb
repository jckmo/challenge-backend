class CreateNominations < ActiveRecord::Migration[6.0]
  def change
    create_table :nominations do |t|
      t.integer :user_id
      t.integer :title_id

      t.timestamps
    end
  end
end
