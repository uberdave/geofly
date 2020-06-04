class AddLinkIdColumnToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :post_num, :string
  end
end
