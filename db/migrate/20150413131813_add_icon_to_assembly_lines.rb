class AddIconToAssemblyLines < ActiveRecord::Migration
  def change
    add_column :assembly_lines, :icon, :string
  end
end
