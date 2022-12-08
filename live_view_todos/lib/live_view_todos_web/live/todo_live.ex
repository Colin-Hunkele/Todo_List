defmodule LiveViewTodosWeb.TodoLive do
  use LiveViewTodosWeb, :live_view

  alias LiveViewTodos.Todos



    def mount(_params, _session, socket) do
        items = Todos.list_todos()

     {:ok, assign(socket, todos: items, editing: %{id: 0, title: ""})}
    end

    def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)

    {:noreply, fetch(socket)}
    end

    defp fetch(socket) do
        assign(socket, todos: Todos.list_todos())
    end

    def handle_event("toggle_done", %{"id" => id}, socket) do
        todo = Todos.get_todo!(id)
        Todos.update_todo(todo, %{done: !todo.done})
        {:noreply, (socket)}
    end

    def handle_event("delete", %{"id" => id}, socket) do
        todo = Todos.get_todo!(id)

        case Todos.delete_todo(todo) do
            {:ok, _} ->
                socket= update(socket, :todos, fn todos -> &Enum.reject(&1.id == todo.id) end)
                {:noreply, socket}


        end
    end
end
