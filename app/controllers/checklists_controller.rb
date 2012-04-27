class ChecklistsController < ApplicationController
  # GET /checklists
  # GET /checklists.json
  def index
    # @checklists = Checklist.all
    @checklists = Checklist.where("vehicle_id = ?", params[:vehicle_id])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checklists }
    end
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/new
  # GET /checklists/new.json
  def new
    @checklist = Checklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/1/edit
  def edit
    @checklist = Checklist.find(params[:id])
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = Checklist.new(params[:checklist])

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to @checklist, notice: 'Checklist was successfully created.' }
        format.json { render json: @checklist, status: :created, location: @checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checklists/1
  # PUT /checklists/1.json
  def update
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      if @checklist.update_attributes(params[:checklist])
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist = Checklist.find(params[:id])
    vehicle_id = @checklist.vehicle_id
    @checklist.destroy

    respond_to do |format|
      format.html { redirect_to checklists_url(:vehicle_id => vehicle_id) }
      format.json { head :no_content }
    end
  end
end
