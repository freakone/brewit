class BetaUser
  include Neo4j::ActiveNode
  include GlobalID::Identification

  property :name, type: String, :null => false
  property :email, type: String, :null => false, index: :exact
  property :updated_at
  property :created_at

  validates_uniqueness_of :email
end
