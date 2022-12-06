class RenamePrefecturesIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prefectures_id, :prefecture_id
  end
end
