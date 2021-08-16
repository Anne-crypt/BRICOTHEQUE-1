class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.decimal :price_day
      t.decimal :price_deposit
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
