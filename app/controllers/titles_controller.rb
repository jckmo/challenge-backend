class TitlesController < ApplicationController
  def index
    render json: Title.all
  end

  def update
    @title = Title.find_by(user_id: params[:userId], title: params[:title][:title])

    if @title
      @title.nominations -= 1
      @title.save
      if @title.nominations < 1
        @title.destroy
      end
    end
  end
end
