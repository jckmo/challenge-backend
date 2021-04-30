class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.string :title
      t.string :year
      t.string :poster
      t.integer :nominations
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
