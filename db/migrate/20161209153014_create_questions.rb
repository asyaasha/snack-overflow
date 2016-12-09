class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :text
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
