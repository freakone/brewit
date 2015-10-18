class Grain
  include Neo4j::ActiveNode

  property :id, type: String
  property :name, type: String
  property :origin, type: String
  property :color, type: Integer
  property :yield, type: Float
  property :fg_cg, type: Float
  property :moisture, type: Float
  property :dp, type: Float
  property :proteins, type: Float
  property :max, type: Float
  property :notes, type: String

  has_one :out, :type, type: :HAS_GRAIN_TYPE, model_class: "GrainType"
end
