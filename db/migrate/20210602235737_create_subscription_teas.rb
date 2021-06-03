class CreateSubscriptionTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_teas do |t|
      t.references :subscription, foreign_key: true
      t.references :tea, foreign_key: true

      t.timestamps
    end
  end
end
