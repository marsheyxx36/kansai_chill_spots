class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,           null: false, default: ""
      t.string :description,           null: false, default: ""
      t.string :address,           null: false, default: ""
      t.string :image,           null: false, default: ""
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
