class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
