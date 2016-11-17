class Server < ApplicationRecord
  belongs_to :person, optional: true
  has_many :repos, dependent: :destroy
end
