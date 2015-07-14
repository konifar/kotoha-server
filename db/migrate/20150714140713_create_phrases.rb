class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :text, null: false, limit: 200
      t.timestamps null: false
    end
    add_index :phrases, :text
  end
end
