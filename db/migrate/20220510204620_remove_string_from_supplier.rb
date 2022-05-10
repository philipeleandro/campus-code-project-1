class RemoveStringFromSupplier < ActiveRecord::Migration[7.0]
  def change
    remove_column :suppliers, :string, :string
  end
end
