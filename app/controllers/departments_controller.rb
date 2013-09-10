class DepartmentsController < ApplicationController


	def index
		@departments = Department.all
	end
	
	def new
		@department = Department.new
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
			params.require(:department).permit(:name)
		end
end
