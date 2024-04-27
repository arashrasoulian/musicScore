class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.string :scorepdf
      t.string :scoretype
      t.string :copmoser
      t.string :arranger
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
