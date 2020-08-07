class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :link
      t.string :slug
      t.string :short
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
