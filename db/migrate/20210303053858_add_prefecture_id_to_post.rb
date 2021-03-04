class AddPrefectureIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :prefecture, null: false, foreign_key: true
  end
end
