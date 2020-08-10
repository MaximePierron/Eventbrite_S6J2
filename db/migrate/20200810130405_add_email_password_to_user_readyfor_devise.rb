class AddEmailPasswordToUserReadyforDevise < ActiveRecord::Migration[5.2]
  def change
    t.string :email,              null: false, default: ""
    t.string :encrypted_password, null: false, default: ""
  end
end
