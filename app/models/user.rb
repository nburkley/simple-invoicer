class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :invoices, :dependent => :destroy
  has_many :clients, :dependent => :destroy
  has_one :profile, :dependent => :destroy

  after_create :create_profile

  private

  def create_profile
    p = Profile.new
    p.user = self
    p.build_address
    p.save!
  end

end
