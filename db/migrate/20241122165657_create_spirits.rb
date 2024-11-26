class CreateSpirits < ActiveRecord::Migration[7.0]
  def change
    create_table :spirits do |t|
      t.string :name
      t.decimal :abv
      t.string :type
      t.timestamps
    end
  end
end