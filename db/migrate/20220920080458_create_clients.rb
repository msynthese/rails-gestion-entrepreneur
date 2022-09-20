class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :prenom
      t.string :nom
      t.string :adresse
      t.string :cp
      t.string :ville
      t.string :pays
      t.string :telephone_fixe
      t.string :telephone_portable
      t.string :email

      t.timestamps
    end
  end
end
