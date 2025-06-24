class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]  #Antes de ejecutar "show, Update o destroy" primero buscar la tarea...
                                                             #por su ID y guardarla en "@task"

  def index
    tasks = Task.all  #"Task.all" hace referencia a todas las tareas guardadas en variable "tasks"
    render json: tasks #Mostrar todas las tareas en formato JSON
  end


  def show
    render json: @task #Mostrar una sola tarea usando el ID de la URL guardado previamente
  end


  def create 
    task = Task.new(task_params) #Creacion de una nueva tarea 
    if task.save #Si la tarea no contiene errores o cumple con los parámetros, entonces...
      render json: task, status: :created #El programa responde con los datos de la nueva tarea en formato JSON 
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity #Si no, se devuelven errores.
    end
  end



  def update
    if @task.update(task_params) #Actualiza la tarea que ya está guardada en los atributos permitidos (title, description, done) 
      render json: @task #y se muestra la tarea actualizada en formato JSON 
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity #mostrarle al usuario los errores
    end
  end


  def destroy
    @task.destroy #La tarea identificada por su ID se elimina
    head :no_content 
  end


  private #Los siguientes métodos son privados - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  
  def set_task
    @task = Task.find_by(id: params[:id]) #Busca una tarea por su ID y la guarda en "@task"
    render json: { error: "Tarea no encontrada" }, status: :not_found unless @task #en caso de una tarea no encontrada
  end

  def task_params
    params.require(:task).permit(:title, :description, :done) #Define task_params como los atributos de "task"
  end

end