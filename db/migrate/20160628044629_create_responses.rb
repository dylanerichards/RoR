class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :full_name
      t.string :email
      t.text :body

      t.timestamps null: false
    end
  end
end
