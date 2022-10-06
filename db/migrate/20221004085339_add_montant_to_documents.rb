class AddMontantToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :montant, :float
  end
end
