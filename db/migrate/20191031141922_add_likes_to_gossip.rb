class AddLikesToGossip < ActiveRecord::Migration[5.2]
  def change
    add_column :gossips, :gossip_like, :integer
  end
end
