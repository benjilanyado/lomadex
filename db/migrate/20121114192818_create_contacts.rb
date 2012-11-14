class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :list_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :link

      t.timestamps
    end
  end
end
