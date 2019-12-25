class Add < ActiveRecord::Migration[6.0]
  def change
   
    remove_column :gifts, :status, :boolean
    add_column :gifts, :status, :boolean ,default: false

  end
end
