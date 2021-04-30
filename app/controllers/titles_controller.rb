class TitlesController < ApplicationController
  def create
    @title = Title.find_by(title: params[:title][:Title])
    if @title
      @title.nominations += 1
      @title.save  
      render json: @title
    else
      @new_title = Title.create(title: params[:title][:Title], year: params[:title][:Year], poster: params[:title][:Poster], nominations: 1)
      render json: @new_title
    end
  end

  def index
    render json: Title.all
  end
end
