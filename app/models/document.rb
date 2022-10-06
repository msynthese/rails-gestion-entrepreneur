class Document < ApplicationRecord
  belongs_to :user
  belongs_to :client
  enum types: %i[Devis Facture]
  enum statut: %i[Creation Attente Accepté Refusé Terminé]
  validates :designation, presence: true
end
