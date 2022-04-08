class Api::V1::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_task, only: %i[show update destroy]

  def index
    @tasks = Task.all.order(:created_at)
    render json: {results: @tasks }, status: :ok
  end

  def show; end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: {results: @task }, status: :ok
    end
  end

  def update
    if @task.update(task_params)

    end
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
