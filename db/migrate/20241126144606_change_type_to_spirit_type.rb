class ChangeTypeToSpiritType < ActiveRecord::Migration[7.0]
  def change
    rename_column :spirits, :type, :spirit_type
  end
end
