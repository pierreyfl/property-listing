class User < ApplicationRecord

  include Likeable::UserMethods
  has_many :subscriptions

  has_settings do |s|
    s.key :preferences,
      defaults: {
        currency: 'USD',
        enable_email: true,
        enable_sms: true
      }
  end

  enum role: [:regular, :admin, :agency, :agent]



  has_one_attached :cover_photo
  has_one_attached :photo


  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook] #:confirmable

  validates :name, presence: true, length: { maximum: 50 }
  has_many :rooms
  has_many :reservations

  has_many :searches

  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
  has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"
  has_many :notifications


  # Use polymorphic association since agent and agency admin need login feature, the reason for not using STI(single table inheritance)
  # is under the consideration of future maintenance.
  #
  # Usage:
  #   agent = Agent.first
  #   agent.user
  #   => #<User ...>
  #
  #   agency = Agency.first
  #   agency.user
  #   => #<User ...>
  #
  belongs_to :userable, polymorphic: true, optional: true



  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        user.uid = auth.uid
        user.provider = auth.provider
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end

  def generate_pin
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end

  def send_pin
    @client = Twilio::REST::Client.new
    @client.messages.create(
    from: '+18582958001',
    to: self.phone_number,
    body: "Your pin is #{self.pin}"
    )
  end

  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end

  def is_active_host
    !self.merchant_id.blank?
  end

  # helper method for creating super admin account in rails console
  def self.create_super_admin(email:, password:, name:)
    transaction do
      user = User.create!(email: email, password: password, name: name)
      user.add_role :super_admin
    end
  end

  # def agency
  #   role = self.roles.where(resource_type: "Agency").first
  #   Agency.find_by(id: role.resource_id)
  # end

  def location
    [country, city, state].join(' ')
  end

  # temporary method
  def fullname
    name
  end

  def photo
    self[:photo] || 'http://placeholder.pics/svg/276x264/DEDEDE/555555/Agency%20logo'
  end

  def type
    self[:type] || 'User'
  end

end
