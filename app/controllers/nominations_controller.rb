class NominationsController < ApplicationController
  def create
    if params[:source] == 'fromSearch'
      @title = Title.find_by(title: params[:title][:Title])

      if @title
        @times_nominated = Nomination.select{|ind| ind.title_id == @title.id}.count
        @title_to_fit_state = {title: @title, times_nominated: @times_nominated}

        render json: @title_to_fit_state
      else
        @title = Title.create(title: params[:title][:Title], year: params[:title][:Year], poster: params[:title][:Poster])
        Nomination.create(title_id: @title.id, user_id: params[:userId])
        @times_nominated = Nomination.select{|ind| ind.title_id == @title.id}.count
        @title_to_fit_state = {title: @title, times_nominated: @times_nominated}

        render json: @title_to_fit_state
      end
    elsif params[:source] == 'fromNoms'
      @title = Title.find_by(title: params[:title][:title])
      Nomination.create(title_id: @title.id, user_id: params[:userId])
      @times_nominated = Nomination.select{|ind| ind.title_id == @title.id}.count
      @title_to_fit_state = {title: @title, times_nominated: @times_nominated}

      render json: @title_to_fit_state
    end
  end

  # acts as index
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
    if params[:source] == 'fromSearch'
      Nomination.find_by(title_id: Title.find_by(title: params[:title][:Title])).destroy
      @title = Title.find_by(title: params[:title][:Title])
      @ind_times_nominated = Nomination.select{|ind| ind.title_id == @title.id}.count
      if @ind_times_nominated < 1
        Title.find_by(title: params[:title][:Title]).destroy
      end
    elsif params[:source] == 'fromNoms'
      Nomination.find_by(title_id: Title.find_by(title: params[:title][:title])).destroy
      @title = Title.find_by(title: params[:title][:title])
      @ind_times_nominated = Nomination.select{|ind| ind.title_id == @title.id}.count
      if @ind_times_nominated < 1
        Title.find_by(title: params[:title][:title]).destroy
      end
    end

    @nominated_titles = []
    @current_user_nomination_ids = []
    @current_user_nominations = []

    Title.all.each do |title|
      @times_nominated = Nomination.select{|ind| ind.title_id == title.id}.count
      @nominated_titles.push({title: title, times_nominated: @times_nominated})
    end

    Nomination.all.select{|nomination| nomination.user_id == params[:userId].to_i}.each do |indiv|
      @current_user_nomination_ids.push(indiv)
    end

    @current_user_nomination_ids.each do |nom_id| 
      @current_user_nominations.push(Title.find(nom_id.title_id))
    end

    @updated_nominations = {nominated_titles: @nominated_titles, current_user_nominations: @current_user_nominations}
    render json: @updated_nominations
  end
end