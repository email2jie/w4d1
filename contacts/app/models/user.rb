class User < ActiveRecord::Base
  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    dependent: :destroy

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
end
