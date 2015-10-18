class Identity
  include Neo4j::ActiveNode

  property :id, type: String
  property :uid, type: String
  property :provider, type: String

  has_one :out, :user, type: :HAS_USER

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end
end
