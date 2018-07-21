# frozen_string_literal: true

class TasksController < ProtectedController
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json:
    {
      task: @tasks,
      current: {
        user: current_user.id
      }
    }
  end

  # GET /tasks/1
  def show
    if current_user.isadmin
      render json: set_task.as_json(except: not_show)
    else
      render json: {
         error: "Require excalation! not enough privileges"
      }
     end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def not_show
    %i[created_at updated_at password_digest token]
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :description, :start_date, :due_date, :status, :user_id)
  end
end
