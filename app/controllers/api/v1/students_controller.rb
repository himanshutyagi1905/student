class Api::V1::StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students, each_serializer: StudentSerializer, status: 200
  end

  def show
    student = Student.find_by(id: params[:id])
    if student
      render json: student, status: 200
    else
      render json: {
        error: "Student not found"
      }
    end
  end

  def create
    student = Student.new(
      name: std_params[:name],
      house: std_params[:house],
      section: std_params[:section]
    )
    if student.save
      render json: student, status: 200
    else
      render json: {
        error: "Error Creating.."
      }
  end
end


  def update
    student = Student.find_by(id: params[:id])
    if student
      student.update(name: params[:name], house: params[:house], section: params[:section])
      render json: "Student record updated"
    else
      render json: { 
      error: "Student not found"
    }
    end
  end

  def destroy
    student = Student.find_by(id: params[:id])
    if student
      student.destroy
      render json: "Student has been deleted"
    end
  end


private
def std_params
  params.require(:student).permit([
    :name,
    :house,
    :section
  ])
 end
end
