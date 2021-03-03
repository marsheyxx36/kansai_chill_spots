class AddAreaIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :area, null: false, foreign_key: true
  end
end
