class AdjunctUnit
  include Neo4j::ActiveNode

  property :name, type: String
  property :value, type: Integer

  has_many :in, :adjuncts, origin: :unit
end
