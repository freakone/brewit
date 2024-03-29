class User
  include Neo4j::ActiveNode
    #
    # Neo4j.rb needs to have property definitions before any validations. So, the property block needs to come before
    # loading your devise modules.
    #
    # If you add another devise module (such as :lockable, :confirmable, or :token_authenticatable), be sure to
    # uncomment the property definitions for those modules. Otherwise, the unused property definitions can be deleted.
    #

     property :username, :type =>   String
     property :created_at, :type => DateTime
     property :updated_at, :type => DateTime

     ## Database authenticatable
     property :email, :type => String, :null => false, :default => ""
     index :email

     property :encrypted_password

     ## If you include devise modules, uncomment the properties below.

     ## Rememberable
     property :remember_created_at, :type => DateTime
     index :remember_token


     ## Recoverable
     property :reset_password_token
     index :reset_password_token
     property :reset_password_sent_at, :type =>   DateTime

     ## Trackable
     property :sign_in_count, :type => Integer, :default => 0
     property :current_sign_in_at, :type => DateTime
     property :last_sign_in_at, :type => DateTime
     property :current_sign_in_ip, :type =>  String
     property :last_sign_in_ip, :type => String

     ## Confirmable
     # property :confirmation_token
     # index :confirmation_token
     # property :confirmed_at, :type => DateTime
     # property :confirmation_sent_at, :type => DateTime

     ## Lockable
     #  property :failed_attempts, :type => Integer, :default => 0
     # property :locked_at, :type => DateTime
     #  property :unlock_token, :type => String,
     # index :unlock_token

      ## Token authenticatable
      # property :authentication_token, :type => String, :null => true, :index => :exact

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :in, :identities, origin: :user

  def self.create_with_omniauth(auth)
    find_or_create({ email: auth.info.email },
      { password: Devise.friendly_token[0,20], username: auth.info.name })
  end
end
