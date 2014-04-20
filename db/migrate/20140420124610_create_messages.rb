class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      t.integer :user_id
      t.integer :topic_id
      t.timestamps
    end
  end
end
