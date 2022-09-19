class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :naissance, :date
    add_column :users, :adresse, :string
    add_column :users, :cp, :string
    add_column :users, :ville, :string
    add_column :users, :pays, :string
    add_column :users, :telephone_fixe, :string
    add_column :users, :telephone_portable, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :responsable, :boolean, default: false
  end
end
