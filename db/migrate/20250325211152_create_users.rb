class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false  
      t.string :email, null: false, unique: true  
      t.string :phone, null: false, unique: true  
      t.string :password_digest, null: false  

      t.timestamps
    end
  end
end
