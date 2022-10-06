class AddColumnDesignationToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :designation, :string
  end
end
