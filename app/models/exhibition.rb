class Exhibition < ApplicationRecord
  EXHIBITIONS_CATEGORIES = ["Collection publiques et privées", "Expositions personelles", "Expositions collectives"]

  validates :category, inclusion: { in: EXHIBITIONS_CATEGORIES }
end
