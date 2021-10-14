class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text       :title,        null: false
      t.references :user,         null: false, foreign_key: true
      t.integer    :category_id,  null: false
      
      t.timestamps
    end
  end
end
