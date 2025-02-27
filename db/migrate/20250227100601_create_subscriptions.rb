class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.boolean :cancelled

      t.timestamps
    end
  end
end
