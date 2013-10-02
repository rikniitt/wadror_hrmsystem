class DepartmentsController < ApplicationController


	def index
		@departments = Department.all
	end
	
	def show
		@department = Department.find(params[:id])
	end
	
	def new
		@department = Department.new
		@faculties = Faculty.all
	end
	
	def create
		Department.create(department_params)
		redirect_to departments_path
	end
	
	def destroy
		department = Department.find params[:id]
		department.delete
		redirect_to departments_path
	end
	
	private
		def department_params
			params.require(:department).permit(:name, :faculty_id)
		end
end
