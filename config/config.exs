# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :teacher,
  ecto_repos: [Teacher.Repo]

# Configures the endpoint
config :teacher, Teacher.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ynLSVWDHn2Yyzt9hHj2VW+jglIKQCZozaT1b6lwEfY5joG9w2NQH2507wWGwMZU6",
  render_errors: [view: Teacher.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Teacher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :exq,
  name: Exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "exq",
  concurrency: 500,
  queues: ["email"],
  scheduler_enable: true

config :exq_ui,
  web_namespace: "exq_ui",
  server: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
