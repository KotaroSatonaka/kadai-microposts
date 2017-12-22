class CreateMicroPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :micro_posts do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
