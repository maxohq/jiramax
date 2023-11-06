import Config

config :oapi_generator,
  default: [
    output: [
      base_module: Jiramax,
      default_operation_module: Ops,
      operation_subdirectory: "operations/",
      schema_subdirectory: "schemas/",
      location: "lib/jiramax"
    ]
  ]
