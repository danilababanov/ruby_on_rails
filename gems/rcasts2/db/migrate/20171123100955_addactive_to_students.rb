class AddactiveToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :active, :boolean, default: :false
  end
end
