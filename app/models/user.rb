class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable

  has_many :events, inverse_of: :owner, foreign_key: :owner_id
  has_one :person, inverse_of: :user, class_name: "Entity::Person"

  delegate :firstname, to: :person, prefix: true, allow_nil: true
  delegate :lastname, to: :person, prefix: true, allow_nil: true

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def to_s
    email
  end

  def name
    if person_firstname.present? && person_lastname.present?
      "#{person_firstname} #{person_lastname}"
    elsif person_firstname.present?
      person_firstname
    else
      email
    end
  end
end
