class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :groups, dependent: :destroy, through: :group_entities, foreign_key: :entity_id
  has_many :group_entities, foreign_key: :entity_id, dependent: :destroy
  
  validates :name, presence: true
  validates :amount, presence: true
end
