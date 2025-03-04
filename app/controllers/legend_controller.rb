class LegendController < ApplicationController
  def index
    @chapters = LegendBookService.chapters
  end

  def show
    @chapters = LegendBookService.chapters
    @current_chapter = params[:chapter]
    @current_section = params[:section]

    @content = LegendBookService.get_section_content(@current_chapter, @current_section)

    render :index
  end
end
