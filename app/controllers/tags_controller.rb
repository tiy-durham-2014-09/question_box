class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions
  end

  def index

    @tags = Tag.where("name ILIKE ?", "%#{params[:term]}%")

    respond_to do |format|
      format.html
      format.json {
        render json: @tags.to_json
      }
    end
  end


end
