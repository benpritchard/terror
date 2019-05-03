# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :terror,
  ecto_repos: [Terror.Repo]

# Configures the endpoint
config :terror, TerrorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VGBYaq/SXL+Qp1kbvcpR4QPN5KM+Sl5uowFYVWZlp/ehic14A8InRld1AHW3UetK",
  render_errors: [view: TerrorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Terror.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
