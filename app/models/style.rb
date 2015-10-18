class Style
  include Neo4j::ActiveNode

  property :name, type: String
  property :subcategory, type: String
  property :aroma, type: String
  property :appearance, type: String
  property :flavor, type: String
  property :mouthfeel, type: String
  property :impression, type: String
  property :comments, type: String
  property :ingredients, type: String
  property :ibu_max, type: Integer
  property :ibu_min, type: Integer
  property :srm_max, type: Integer
  property :srm_min, type: Integer
  property :og_max, type: Float
  property :og_min, type: Float
  property :fg_max, type: Float
  property :fg_min, type: Float
  property :abv_max, type: Float
  property :abv_min, type: Float

  has_one :out, :category, type: :HAS_STYLE_CATEGORY, model_class: "StyleCategory"
end
