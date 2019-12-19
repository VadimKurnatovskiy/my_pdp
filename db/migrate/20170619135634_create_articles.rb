class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
