class CreateTimezones < ActiveRecord::Migration[5.1]
  def change
    create_table :timezones do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :city
      t.integer :difference

      t.timestamps
    end
  end
end
