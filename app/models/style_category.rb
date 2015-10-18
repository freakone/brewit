class StyleCategory
  include Neo4j::ActiveNode

  property :id, type: String
  property :name, type: String

  has_many :in, :styles, origin: :category
end
