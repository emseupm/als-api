class CreateAssemblyLines < ActiveRecord::Migration
  def change
    create_table :assembly_lines do |t|
      t.string :name

      t.timestamps
    end
  end
end
