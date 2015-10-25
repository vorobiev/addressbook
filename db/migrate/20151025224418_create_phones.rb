class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :contact, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
