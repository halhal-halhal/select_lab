class AddColumnToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :code, :string
  end
end
