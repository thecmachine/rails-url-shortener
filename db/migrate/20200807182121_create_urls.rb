class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :link
      t.string :short
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
