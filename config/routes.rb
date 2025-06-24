Rails.application.routes.draw do
  resources :tasks

  #Indicación para rails de que el proyecto usará las rutas:

    # - GET /tasks (listar todas las tareas) <-- index
    # - POST /tasks (crear una nueva tarea)  <-- create
    # - GET  /tasks/:id (ver una tarea específica) <-- show
    # - PATCH /tasks/:id (Actualizar tarea, DONE si ya está hecha) <-- update
    # - DELETE /tasks/:id (eliminar tarea) <-- destroy
end
