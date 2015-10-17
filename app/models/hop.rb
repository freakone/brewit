class Hop
  include Neo4j::ActiveNode

  property :name, type: String
  property :origin, type: String
  property :alpha_acids, type: Float
  property :beta_acids, type: Float
  property :hsi, type: Float
  property :notes, type: String

  has_many :out, :types, type: :HAS_TYPE, model_class: "HopType"
  has_one :out, :form, type: :HAS_FORM, model_class: "HopForm"
end
