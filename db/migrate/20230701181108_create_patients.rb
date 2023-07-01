class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :date_of_birth
      t.string :city
      t.string :address
      t.string :mobile_no
      t.references :user
      
      t.timestamps
    end
  end
end
