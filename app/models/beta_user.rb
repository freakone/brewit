class BetaUser
  include Neo4j::ActiveNode

  property :name, type: String
  property :email, type: String, :null => false,  index: :exact
  property :updated_at
  property :created_at
end
