class Api::V1::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(:created_at)
    render json: {results: @tasks }, status: :ok
  end

  # GET /tasks/1 or /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit; end

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
