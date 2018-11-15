class CreateHandles < ActiveRecord::Migration[5.2]
  def change
    create_table :handles do |t|
      t.belongs_to :email, index: true
      t.string :name
      t.timestamps
    end
  end
end
