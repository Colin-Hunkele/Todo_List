import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :live_view_todos, LiveViewTodos.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "live_view_todos_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_view_todos, LiveViewTodosWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "LaMgoYrVUXfD9ItVH7WRhP5cApKmvdR6E4NQmAo+x86yH2iXEKYj09yBPP9fW1XO",
  server: false

# In test we don't send emails.
config :live_view_todos, LiveViewTodos.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
