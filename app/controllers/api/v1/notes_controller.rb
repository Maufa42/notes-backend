class NotesController < ApplicationController
  def index
    note = Note.all.order("created_at DESC");
    render json: {
      status: "Success",
      message: "Render Notes",
      data: note
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
    note = Notebook.notes.create(params_note);
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
             params.require(:note).permit(:noteTitle,:note);
          end



end
