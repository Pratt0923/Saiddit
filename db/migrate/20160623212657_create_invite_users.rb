class CreateInviteUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :invite_users do |t|

      t.timestamps
    end
  end
end
