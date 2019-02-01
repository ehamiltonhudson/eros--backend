class AddCompatibleSignsToSun < ActiveRecord::Migration[5.2]
  def change
    add_column :suns, :compat_signs, :string
  end
end
