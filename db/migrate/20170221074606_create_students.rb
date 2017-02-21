class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :rank
      t.integer :first
      t.integer :second
      t.integer :third

      t.timestamps
    end
  end
end
