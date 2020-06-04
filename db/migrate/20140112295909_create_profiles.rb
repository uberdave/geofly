class CreateProfiles < ActiveRecord::Migration
  def up
  create_table  :profiles do |t|
  t.belongs_to :user
  t.string     :image
  t.string     :title
  t.string     :description
  t.string     :ext_link
  t.string     :post_type
  t.datetime   :expire_date
  end
end
  def down
  drop_table :profiles
  end
end
