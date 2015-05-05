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
end
