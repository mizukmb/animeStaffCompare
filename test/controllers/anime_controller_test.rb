require 'rails_helper'

describe AnimeController do
  it "should get scrape" do
    hash = AnimeController.new
    data= hash.scrape(5292) # SHIROBAKO
    expect(data['タイトル']).to eq 'SHIROBAKO'
  end
end
# class AnimeControllerTest < ActionController::TestCase
#   test "should get index" do
#     get :index
#     assert_response :success
#   end
#
#   test "should get result" do
#     get :result
#     assert_response :success
#   end
#
#   test "should get scrape" do
#     hash = AnimeController.scrape(5292) # SHIROBAKO
#     expect(hash['タイトル']).to eq 'SHOROBAKO'
#   end
# end
