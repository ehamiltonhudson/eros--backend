class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.references :sun, foreign_key: true

      t.timestamps
    end
  end
end
