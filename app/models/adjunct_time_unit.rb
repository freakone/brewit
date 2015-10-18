class AdjunctTimeUnit
  include Neo4j::ActiveNode

  property :id, type: String
  property :name, type: String
  property :value, type: Integer

  has_many :in, :adjuncts, origin: :time_unit
end
