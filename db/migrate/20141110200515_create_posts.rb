class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
