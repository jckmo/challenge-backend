class NominationsController < ApplicationController
  def create
    @title = Title.find_by(title: params[:title][:title])
    byebug
    if @title
      Nomination.create(title_id: @title.id, user_id: params[:userId])
      render json: @title
    else
      @title = Title.create(title: params[:title][:Title], year: params[:title][:Year], poster: params[:title][:Poster])
      Nomination.create(title_id: @title.id, user_id: params[:userId])
      
      # what is actually happening here
      @title_to_fit_state = {title: @title}
      render json: @title_to_fit_state
    end

  end

  def update
    if params[:userId] == 0
      @nominated_titles = []
      Title.all.each do |title|
        @times_nominated = Nomination.select{|ind| ind.title_id == title.id}.count
        @nominated_titles.push({title: title, times_nominated: @times_nominated})
      end
      render json: @nominated_titles
    else
      @current_user_nomination_ids = []
      Nomination.all.select{|nomination| nomination.user_id == params[:userId].to_i}.each do |indiv|
        @current_user_nomination_ids.push(indiv)
      end
      @current_user_nominations = []
      @current_user_nomination_ids.each do |nom_id| 
        @current_user_nominations.push(Title.find(nom_id.title_id))
      end
      render json: @current_user_nominations
    end
  end

  def destroy
    @nomination = Nomination.find_by(title_id: Title.find_by(title: params[:title][:title])).destroy
  end
end