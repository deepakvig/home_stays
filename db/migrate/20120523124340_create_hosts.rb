class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :ref
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
