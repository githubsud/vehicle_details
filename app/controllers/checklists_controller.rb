class ChecklistsController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklists = @vehicle.checklists
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.new
  end

  def edit
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.find(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.new(params[:checklist])

    if @checklist.save
      redirect_to vehicle_checklist_path(@vehicle, @checklist), notice: 'Checklist was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.find(params[:id])

    if @checklist.update_attributes(params[:checklist])
      redirect_to vehicle_checklist_path(@vehicle, @checklist), notice: 'Checklist was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @checklist = @vehicle.checklists.find(params[:id])
    @checklist.destroy

    redirect_to vehicle_checklists_url(@vehicle)
  end

end
