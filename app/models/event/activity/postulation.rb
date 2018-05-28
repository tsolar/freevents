class Event::Activity::Postulation < ApplicationRecord
  belongs_to :event
  has_one :event_activity,
    class_name: "Event::Activity",
    foreign_key: :event_activity_postulation_id

  ACTIVITY_TYPES = %w(workshop speech)
  ACTIVITY_DIFFICULTY_LEVELS = %w(everyone easy medium hard expert)

  validates :postulant_firstname, presence: true
  validates :postulant_lastname, presence: true
  validates :postulant_email, presence: true
  validates :postulant_bio, length: { maximum: 300 }

  validates :activity_title, presence: true
  validates :activity_description, presence: true
  validates :activity_type, inclusion: { in: ACTIVITY_TYPES }
  validates :activity_difficulty_level,
    inclusion: { in: ACTIVITY_DIFFICULTY_LEVELS }

  def approve
    # TODO: to prevent create a duplicated activity
    # first, find an activity by postulation (self)
    # and if exists, use that activity, else create a new one
    activity = Event::Activity.create(
      event_day: self.event.days.first,
      title: self.activity_title,
      description: self.activity_description,
      postulation: self
    )

    email = ::Email.find_by(address: self.postulant_email)
    if email.present?
      participant = email.emailable
    else
      participant = Entity::Person.create(
        firstname: self.postulant_firstname,
        lastname: self.postulant_lastname,
        bio: self.postulant_bio,
        user: User.create(email: self.postulant_email)
      )
      participant.emails.create(address: self.postulant_email)
    end

    event_participation = Event::Participation.create(
      participant: participant,
      event: self.event
    )

    activity_participation = Event::Activity::Speaker.create(
      event_activity: activity,
      event_participation: event_participation
    )
  end
end
