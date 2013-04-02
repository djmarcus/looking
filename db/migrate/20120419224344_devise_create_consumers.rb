class DeviseCreateConsumers < ActiveRecord::Migration
  def self.up
    create_table(:consumers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

#    add_index :consumer, :email,                :unique => true
#    add_index :consumer, :reset_password_token, :unique => true
    # add_index :consumers, :confirmation_token,   :unique => true
    # add_index :consumers, :unlock_token,         :unique => true
    # add_index :consumers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :consumers
  end
end
