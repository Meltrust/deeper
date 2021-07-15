class RenameDeepToTextInDeeps < ActiveRecord::Migration[6.1]
  def change
    rename_column :deeps, :deep, :text
  end
end
