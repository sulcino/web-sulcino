class ZeroDayController < ApplicationController
  def index
    @chapters = ZeroDayBookService.chapters
  end

  def show
    @chapters = ZeroDayBookService.chapters
    @current_chapter = params[:chapter]
    @current_section = params[:section]

    @content = ZeroDayBookService.get_section_content(@current_chapter, @current_section)

    render :index
  end
end
