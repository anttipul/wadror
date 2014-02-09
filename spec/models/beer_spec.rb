require 'spec_helper'

describe Beer do
  it "name and style correctly" do
    beer = Beer.create name:"Olut", style:"IPA"
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)

  end

  it "is not saved without a name" do
    beer = Beer.create :style => "IPA"

    expect(beer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end

  it "is not saved without a style" do
    beer = Beer.create :name => "Olut"

    expect(beer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end
end
