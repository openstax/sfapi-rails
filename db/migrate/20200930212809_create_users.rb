class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :has_access
      t.boolean :is_admin

      t.timestamps
    end
  end
end