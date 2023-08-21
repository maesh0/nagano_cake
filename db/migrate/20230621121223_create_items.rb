class CreateItems < ActiveRecord::Migration[6.1]
  has_one_attached :image

  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
