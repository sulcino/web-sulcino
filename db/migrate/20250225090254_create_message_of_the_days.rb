class CreateMessageOfTheDays < ActiveRecord::Migration[8.0]
  def change
    create_table :message_of_the_days do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text_en
      t.text :text_cs

      t.timestamps
    end
  end
end
