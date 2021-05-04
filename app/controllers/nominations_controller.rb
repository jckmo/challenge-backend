class NominationsController < ApplicationController
  def create
    @title = Title.find_by(title: params[:title][:Title])
    
    if @title 
      Nomination.create(user_id: params[:userId], title_id: @title.id).save
      @nominations_for_title =  Nomination.select{|nomination| nomination.title_id == @title.id}
      @title.nominations = @nominations_for_title.count
      @title.save
      render json: @title
    else 
      @title = Title.create(title: params[:title][:Title], year: params[:title][:Year], poster: params[:title][:Poster], nominations: 0, user_id: params[:userId])
      Nomination.create(user_id: params[:userId], title_id: @title.id)
      render json: @title
    end
  end
end
