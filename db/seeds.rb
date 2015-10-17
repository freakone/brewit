HopType.delete_all
HopType.create!(name: "bittering", value: 0)
HopType.create!(name: "aroma", value: 1)

HopForm.delete_all
HopForm.create!(name: "pellet", value: 0)

GrainType.delete_all
GrainType.create!(name: "malt", value: 0)
GrainType.create!(name: "extract", value: 1)
GrainType.create!(name: "sugar", value: 2)
GrainType.create!(name: "adjunct", value: 3)
GrainType.create!(name: "dry_extract", value: 4)

YeastType.delete_all
YeastType.create!(name: "ale", value: 0)
YeastType.create!(name: "lager", value: 1)
YeastType.create!(name: "wine", value: 2)
YeastType.create!(name: "champagne", value: 3)
YeastType.create!(name: "wheat", value: 4)

YeastForm.delete_all
YeastForm.create!(name: "liquid", value: 0)
YeastForm.create!(name: "dry", value: 1)
YeastForm.create!(name: "slant", value: 2)
YeastForm.create!(name: "culture", value: 3)

YeastFlocculation.delete_all
YeastFlocculation.create!(name: "low", value: 0)
YeastFlocculation.create!(name: "medium", value: 1)
YeastFlocculation.create!(name: "high", value: 2)

AdjunctTimeUnit.delete_all
AdjunctTimeUnit.create!(name: "minutes", value: 0)
AdjunctTimeUnit.create!(name: "hours", value: 1)
AdjunctTimeUnit.create!(name: "days", value: 2)

AdjunctType.delete_all
AdjunctType.create!(name: "spice", value: 0)
AdjunctType.create!(name: "fining", value: 1)
AdjunctType.create!(name: "herb", value: 2)
AdjunctType.create!(name: "flavor", value: 3)
AdjunctType.create!(name: "other", value: 4)
AdjunctType.create!(name: "water_agent", value: 5)

AdjunctUnit.delete_all
AdjunctUnit.create!(name: "grams", value: 0)
