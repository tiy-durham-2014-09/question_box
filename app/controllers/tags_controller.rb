class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions
  end

  def index
    @tags = Tag.where("name ILIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html

      format.json do
        render json: [{ label: @tags.first.name, value: @tags.first.name}]
      end
    end
  end
end
