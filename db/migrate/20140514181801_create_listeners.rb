class CreateListeners < ActiveRecord::Migration
  def change
    create_table :listeners do |t|
      t.string :username

      t.timestamps
    end
  end
end
