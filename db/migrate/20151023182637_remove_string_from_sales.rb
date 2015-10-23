class RemoveStringFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :string
  end
end
