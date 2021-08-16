class AddNameToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :name, :string, null: false
  end
end
