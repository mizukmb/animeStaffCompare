require 'rails_helper'

describe AnimeController do
  it "should get scrape" do
    hash = AnimeController.new
    data= hash.scrape(5292) # SHIROBAKO
    expect(data['タイトル']).to eq 'SHIROBAKO'
  end

  it "404ページは abort する" do
    hash = AnimeController.new
    begin
      data = hash.scrape(9999) # 404 Not Found
    rescue SystemExit=>e
      expect(e.status).to eq(1)
    end
  end
end
