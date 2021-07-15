class AddPersonalInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullname, :string
  end
end
