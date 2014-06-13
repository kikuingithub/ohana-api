class Fax < ActiveRecord::Base
  attr_accessible :number, :department

  belongs_to :location, touch: true

  validates :number,
            presence: { message: "can't be blank for Fax" },
            fax: true

  normalize_attributes :number, :department

  include Grape::Entity::DSL
  entity do
    expose :id
    expose :number, unless: ->(o, _) { o.number.blank? }
    expose :department, unless: ->(o, _) { o.department.blank? }
  end
end
