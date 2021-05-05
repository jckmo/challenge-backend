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

  def update
    @nominated_titles = []
    Title.all.each do |title|
      @times_nominated = Nomination.select{|ind| ind.title_id == title.id}.count
      @nominated_titles.push({title: title, times_nominated: @times_nominated})
    end

    @current_user_nomination_ids = []
    Nomination.all.select{|nomination| nomination.user_id == params[:userId].to_i}.each do |indiv|
      @current_user_nomination_ids.push(indiv)
    end

    @current_user_nominations = []
    @current_user_nomination_ids.each do |nom_id| 
      @current_user_nominations.push(Title.find(nom_id.title_id))
    end

    @toBeRendered = {nominated_titles: @nominated_titles, current_user_nominations: @current_user_nominations}

    render json: @toBeRendered
  end
end