class Exposition < ApplicationRecord
  EXPOSITIONS_CATEGORIES = ["Collection publiques et privées", "Expositions personelles", "Expositions collectives"]

  validates :category, inclusion: { in: EXPOSITIONS_CATEGORIES }
end
