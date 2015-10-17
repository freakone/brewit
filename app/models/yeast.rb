class Yeast
  include Neo4j::ActiveNode

  property :name, type: String
  property :lab, type: String
  property :id, type: String
  property :min_attenuation, type: Float
  property :max_attenuation, type: Float
  property :min_temperature, type: Float
  property :max_temperature, type: Float
  property :notes, type: String

  has_one :out, :type, type: :HAS_TYPE, model_class: "YeastType"
  has_one :out, :form, type: :HAS_FORM, model_class: "YeastForm"
  has_one :out, :flocculation, type: :HAS_FLOCCULATION, model_class: "YeastFlocculation"
end
