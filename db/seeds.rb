HopType.delete_all
HopForm.delete_all
GrainType.delete_all

HopType.create!(name: "bittering", value: 0)
HopType.create!(name: "aroma", value: 1)

HopForm.create!(name: "pellet", value: 0)

GrainType.create!(name: "malt", value: 0)
GrainType.create!(name: "extract", value: 1)
GrainType.create!(name: "sugar", value: 2)
GrainType.create!(name: "adjunct", value: 3)
GrainType.create!(name: "dry_extract", value: 4)
