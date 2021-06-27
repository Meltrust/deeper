class CreateDeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :deeps do |t|
      t.text :deep

      t.timestamps
    end
  end
end
