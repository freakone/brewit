class Adjunct
  include Neo4j::ActiveNode

  property :name, type: String
  property :notes, type: String
  property :use_for, type: String
  property :time, type: Float

  has_one :out, :type, type: :HAS_ADJUNCT_TYPE, model_class: "AdjunctType"
  has_one :out, :unit, type: :HAS_ADJUNCT_UNIT, model_class: "AdjunctUnit"
  has_one :out, :use, type: :HAS_ADJUNCT_USE, model_class: "AdjunctUse"
  has_one :out, :time_unit, type: :HAS_ADJUNCT_TIME_UNIT, model_class: "AdjunctTimeUnit"
end
