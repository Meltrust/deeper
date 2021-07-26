class AddReferencesToDeeps < ActiveRecord::Migration[6.1]
  def change
    add_reference :deeps, :user, null: false, foreign_key: true
  end
end
