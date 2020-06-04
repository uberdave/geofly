class CreatePostsAndProfiles < ActiveRecord::Migration
  def up
  create_table :posts_profiles do |t|
      t.belongs_to :post
      t.belongs_to :profile
    end
  end

  def down
  drop_table :posts_users
  
  end
end
