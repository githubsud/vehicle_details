class NotesController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @notes = @vehicle.notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.find(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to vehicle_note_path(@vehicle, @note), notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to vehicle_note_path(@vehicle, @note), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @note = @vehicle.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_notes_url(@vehicle) }
      format.json { head :no_content }
    end
  end
end
