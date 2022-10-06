class Client < ApplicationRecord
  has_many :documents
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :adresse, presence: true
  validates :cp, presence: true
  validates :ville, presence: true
  validates :pays, presence: true
  validates :telephone_portable, presence: true
  validates :email, presence: true
end
