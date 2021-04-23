class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.text :content
      t.string :gamer_tag
      t.string :platform

      t.timestamps
    end
  end
end
