class RenameTypeToDocuments < ActiveRecord::Migration[7.0]
  def change
    rename_column :documents, :type, :types
  end
end
