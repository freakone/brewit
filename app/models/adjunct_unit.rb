class AdjunctUnit
  include Neo4j::ActiveNode

  property :name, type: String
  property :values
  serialize :values

  has_many :in, :adjuncts, origin: :unit
end
