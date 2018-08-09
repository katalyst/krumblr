class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.references :user
      t.references :post
      t.string     :kind
      t.index      :kind
      t.timestamps
    end
  end
end
