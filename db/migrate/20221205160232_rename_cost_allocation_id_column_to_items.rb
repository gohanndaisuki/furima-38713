class RenameCostAllocationIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :cost_allocation_id, :shipping_fee_status_id
  end
end
