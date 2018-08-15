class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @appointment = Appointment.new
    @appointments = Appointment.all
    @categories = Category.all
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to appointments_path(@appointment)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    @appointment.save
    redirect_to appointments_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path(@appointment)
  end


  private

  def appointment_params
    params.require(:appointment).permit(:title,
                                        :description,
                                        :start_time,
                                        :end_time,
                                        :allDay,
                                        category_ids:[],
                                        categories_attributes: [:name])
                                        .merge(user_id: current_user.id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
