class User < ApplicationRecord
  include FindDefault
  include ListParanoid

  authenticates_with_sorcery!

  # 関連
  has_many :api_keys, dependent: :destroy

  # validations
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

  def self.login?(access_token)
    api_key = ApiKey.find_by_access_token(access_token)
    return false if !api_key || !api_key.before_expired? || !api_key.active
    return !self.find(api_key.user_id).nil?

  end

  def self.attribute_names
    attribute_names = super
    attribute_names.concat([
      'password',
      'password_confirmation'
    ]).uniq
  end

  def activate
    return ApiKey.create(user_id: self.id) if !api_key
    if !api_key.active
      api_key.set_active
      api_key.save
    end
    if !api_key.before_expired?
      api_key.set_expiration
      api_key.save
    end
    api_key
  end

  def inactivate
    api_key.active = false
    api_key.save
  end

  def as_json(options)
    options = super(options)
    options.delete(:crypted_password)
    options.delete(:salt)
    options
  end

  private

    def api_key
      @api_key ||= ApiKey.find_by_user_id(self.id)
    end

end
