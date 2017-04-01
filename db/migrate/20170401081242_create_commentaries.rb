class CreateCommentaries < ActiveRecord::Migration[5.0]
  def change
    create_table :commentaries do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.integer :grade
      t.text :content

      t.timestamps
    end
  end
end
