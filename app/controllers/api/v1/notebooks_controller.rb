module Api
  module V1
class NotebooksController < ApplicationController
  before_action :set_notebook, only: %i[show update destroy ]
  def index
    notebooks = Notebook.all.order("created_at DESC");
    render json: {
      status: "Success",
      message: "ALL  Notebooks",
      data: notebooks
    },status: :ok
  end
  
  def show
    if @notebook
      render json:{
        status: "Success",
        message: "Render NoteBook",
        data: @notebook
      },status: :ok
      else
        render json: {
          status: "Failed",
          message: "Invalid ID",
          data: @notebook
        },status: :unprocessable_entity
      end
  end
  
  def create
    @notebook = Notebook.create(params_notebook);
    if @notebook.save
      render json: {
        status: "Success",
        message: "Created kittens",
        data: @notebook
      },status: :ok
    else
      render json: {
        status: "Failed",
        message: "Not Created Kittens",
        data: @notebook
      },status: :unprocessable_entity
    end

  end

  def update
    if @notebook.update(params_notebook)
      render json: {
        status: "Success",
        message: "Updated Kittens",
        data:@notebook
      },status: :ok
    else
      render json: {
        status: "Failed",
        message: "Updated noteBook",
        # data:notebook
      },status: :unprocessable_entity
    end
  end

  def destroy
    @notebook.destroy
    render json: {
      status: "Success",
      message: "Deleted noteBook",
      data:@notebook
    },status: :ok
  end

  private
  def params_notebook
    params.require(:notebook).permit(:notebookName);
  end
  def set_notebook
    @notebook = Notebook.find(params[:id])
  end
end

end
  
end