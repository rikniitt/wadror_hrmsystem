class ResearchGroupMembersController < ApplicationController
  before_action :set_research_group_member, only: [:show, :edit, :update, :destroy]

  # GET /research_group_members
  # GET /research_group_members.json
  def index
    @research_group_members = ResearchGroupMember.all
  end

  # GET /research_group_members/1
  # GET /research_group_members/1.json
  def show
  end

  # GET /research_group_members/new
  def new
		@research_group = ResearchGroup.find(params[:research_group_id])
		redirect_to :back if @research_group.nil?
		
		@employees = Employee.all
		@research_group_member = ResearchGroupMember.new
  end

  # GET /research_group_members/1/edit
  def edit
  end

  # POST /research_group_members
  # POST /research_group_members.json
  def create

		group = ResearchGroup.find(research_group_member_params[:research_group_id])
		employee = Employee.find(research_group_member_params[:employee_id])

		if group.nil? or employee.nil? or group.members.include? employee
			redirect_to :back
		else
			group.members << employee
			redirect_to group
		end
  end

  # PATCH/PUT /research_group_members/1
  # PATCH/PUT /research_group_members/1.json
  def update
    respond_to do |format|
      if @research_group_member.update(research_group_member_params)
        format.html { redirect_to @research_group_member, notice: 'Research group member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @research_group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_group_members/1
  # DELETE /research_group_members/1.json
  def destroy
    @research_group_member.destroy
    respond_to do |format|
      format.html { redirect_to research_group_members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_group_member
      @research_group_member = ResearchGroupMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_group_member_params
      params.require(:research_group_member).permit(:employee_id, :research_group_id)
    end
end
