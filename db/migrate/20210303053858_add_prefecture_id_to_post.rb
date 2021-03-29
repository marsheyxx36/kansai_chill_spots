class AddPrefectureIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :prefecture_id, null: false
  end
end
