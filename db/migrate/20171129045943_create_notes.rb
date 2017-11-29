class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body, null: false
      t.timestamps
    end
  end
end
