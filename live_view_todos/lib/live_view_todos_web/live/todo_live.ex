defmodule LiveViewTodosWeb.TodoLive do
  use LiveViewTodosWeb, :live_view

  alias LiveViewTodos.Todos

  def mount(_params, _session, socket) do
  todos = Todos.list_todos()
  {:ok, assign(socket, todos: todos, editing: %{id: 0, name: ""})}
end

end