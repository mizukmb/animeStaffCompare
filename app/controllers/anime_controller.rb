require 'open-uri'
require 'nokogiri'

class AnimeController < ApplicationController
  def index
    # Controllerでrenderやredirect_toなどで明示的にレンダリングするViewをしていない場合は、
    # メソッド名のViewファイルがレンダリングされる（例：new => new.html.erb）
    @anime = Anime.new
  end

  def search
    h = params[:anime]
    render :text => "タイトル : #{h['title']}"
  end

  def result
  end

  def scrape(num)
    uri = "http://lain.gr.jp/mediadb/media/#{num}"

    begin
      res = open(uri)
    rescue OpenURI::HTTPError => e
      abort(e.message)
    end

    hash = Hash.new("none")
    page = Nokogiri::HTML.parse(res, nil, 'utf-8')
    page.xpath('/html/body/div[@class="container"]/div[@class="row"]/div[@class="span13"]/div[@id="media-db"]/dl').each do |node|
      key = node.xpath('./dt')
      value = node.xpath('./dd')
      key.length.times do |i|
        hash.store(key[i].text.to_s, value[i].text.to_s)
        # p "#{key[i].text.to_s}:#{value[i].text.to_s}"
      end
    end
    return hash
  end
end
