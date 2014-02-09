require 'spec_helper'

include OwnTestHelper

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user, username:"Matti" }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end

  it "shows ratings" do
    FactoryGirl.create :rating, score: 15, beer_id: beer1.id, user_id:user.id
    FactoryGirl.create :rating, score: 16, beer_id: beer2.id, user_id:user.id
    visit ratings_path
    expect(page).to have_content 'Number of ratings: 2'
    expect(page).to have_content '15'
    expect(page).to have_content '16'
  end

  it "show ratings on user's page" do
    FactoryGirl.create :rating, score: 13, beer_id: beer1.id, user_id:user.id
    FactoryGirl.create :rating, score: 16, beer_id: beer2.id, user_id:user.id
    FactoryGirl.create :rating, score: 17, beer_id: beer2.id, user_id:user2.id
    visit user_path(user)
    expect(page).to have_content 'Pekka has made 2 ratings'
    expect(page).to have_content '13'
    expect(page).to have_content '16'
    expect(page).to have_content '14.5'
  end

  it "deletes a rating" do
    FactoryGirl.create :rating, score: 13, beer_id: beer1.id, user_id:user.id
    FactoryGirl.create :rating, score: 16, beer_id: beer2.id, user_id:user.id
    visit user_path(user)
    page.all('a', :text => "delete").first.click
    expect(user.ratings.count).to eq(1)
    expect(page).to have_content 'Pekka has made 1 rating'
    expect(page).not_to have_content("13")
    expect(page).to have_content("16")

  end
end
