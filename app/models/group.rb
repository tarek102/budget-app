class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :group_entities, foreign_key: :entity_id, dependent: :destroy
  has_many :entities, dependent: :destroy, through: :group_entities



  validates :name, presence: true
  validates :icon, presence: true

  def total_expenses
    entities.sum('amount')
  end
end
