class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.references :user, index: true

      t.timestamps null: false
    end

    add_index :articles, :title, unique: true
    add_index :articles, :created_at
  end
end
