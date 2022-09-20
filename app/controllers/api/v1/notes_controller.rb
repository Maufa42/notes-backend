module Api
  module V1
class NotesController < ApplicationController
  before_action :set_notebook, only: %i[show update destroy ]
  before_action :set_note, only: %i[show update destroy ]
  def index
    notes = Note.all.order("created_at DESC");
    render json: {
      status: "Success",
      message: "Render Notes",
      data: notes
    },status: :ok
  end
  
  def show
    if @note
      render json:{
        status: "Success",
        message: "Render Note",
        data: @note
      },status: :ok
      else
        render json: {
          status: "Failed",
          message: "Invalid ID",
          data: @note
        },status: :unprocessable_entity
      end
  end
  
  def create
    # debugger
    @notebook = Notebook.find(params[:notebook_id])
    @note = @notebook.notes.create(params_note);
    if @note.save
      render json: {
        status: "Success",
        message: "Created Note",
        data: @note
      },status: :ok
    else
      render json: {
        status: "Failed",
        message: "Not Created Note",
        data: @note
      },status: :unprocessable_entity
    end

  end

  def update
    if @note.update(params_note)
      render json: {
        status: "Success",
        message: "Updated Note",
        data:@note
      },status: :ok
    else
      render json: {
        status: "Failed",
        message: "Updated Note",
        # data:notebook
      },status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    render json: {
      status: "Success",
      message: "Deleted Note",
      data:@note
    },status: :ok
  end

    private
      
          def params_note
             params.permit(:noteTitle,:note,:notebook_id);
          end

          def set_notebook
            @notebook = Notebook.find(params[:notebook_id])
          end
          def set_note
            @note = Note.find(params[:id])
          end

end   
end
end