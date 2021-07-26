class CreateCategoryAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :category_attachments do |t|
      t.integer :category_id
      t.string :attachment

      t.timestamps
    end
  end
end
