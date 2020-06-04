class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.text :category
      t.text :tag
      t.text :title
      t.text :description
      t.text :image
      t.text :ext_link
      t.text :type
      t.text :expire_date
      t.timestamps
    end
  end
end
