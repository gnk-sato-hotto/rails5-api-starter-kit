class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.timestamp :expires_at
      t.integer :user_id
      t.boolean :active
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
