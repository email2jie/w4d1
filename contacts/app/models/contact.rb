class Contact < ActiveRecord::Base
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  validates :name, presence: true, uniqueness: { scope: :user_id }

  def self.contacts_for_user_id(user_id)
    joins_cond = <<-SQL
      LEFT OUTER JOIN
        contact_shares ON contacts.id = contact_shares.contact_id
    SQL
    where_cond = <<-SQL
      ((contacts.user_id = :user_id) OR (contact_shares.user_id = :user_id))
    SQL

    Contact
      .joins(joins_cond)
      .where(where_cond, :user_id => user_id)
      .uniq
  end
end
