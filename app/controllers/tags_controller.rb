class TagsController < ApplicationController
  def show
    @tag = Tag.friendly.find(params[:id])
    @questions = @tag.questions
  end

  def index
    @tags = Tag.where("name ILIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html

      format.json do
        render json: @tags.to_json
      end
    end
  end
end
