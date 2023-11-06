defmodule Jiramax.DynamicModules do
  @moduledoc """
  Provides API endpoints related to dynamic modules
  """

  @default_client Jiramax.Client

  @doc """
  Get modules

  Returns all modules registered dynamically by the calling app.

  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  """
  @spec dynamic_modules_resource_get_modules_get(keyword) ::
          {:ok, Jiramax.ConnectModules.t()} | {:error, Jiramax.ErrorMessage.t()}
  def dynamic_modules_resource_get_modules_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.DynamicModules, :dynamic_modules_resource_get_modules_get},
      url: "/rest/atlassian-connect/1/app/module/dynamic",
      method: :get,
      response: [{200, {Jiramax.ConnectModules, :t}}, {401, {Jiramax.ErrorMessage, :t}}],
      opts: opts
    })
  end

  @doc """
  Register modules

  Registers a list of modules.

  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  """
  @spec dynamic_modules_resource_register_modules_post(Jiramax.ConnectModules.t(), keyword) ::
          :ok | {:error, Jiramax.ErrorMessage.t()}
  def dynamic_modules_resource_register_modules_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.DynamicModules, :dynamic_modules_resource_register_modules_post},
      url: "/rest/atlassian-connect/1/app/module/dynamic",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.ConnectModules, :t}}],
      response: [
        {200, :null},
        {400, {Jiramax.ErrorMessage, :t}},
        {401, {Jiramax.ErrorMessage, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove modules

  Remove all or a list of modules registered by the calling app.

  **[Permissions](#permissions) required:** Only Connect apps can make this request.

  ## Options

    * `moduleKey`: The key of the module to remove. To include multiple module keys, provide multiple copies of this parameter.
      For example, `moduleKey=dynamic-attachment-entity-property&moduleKey=dynamic-select-field`.
      Nonexistent keys are ignored.

  """
  @spec dynamic_modules_resource_remove_modules_delete(keyword) ::
          :ok | {:error, Jiramax.ErrorMessage.t()}
  def dynamic_modules_resource_remove_modules_delete(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:moduleKey])

    client.request(%{
      args: [],
      call: {Jiramax.DynamicModules, :dynamic_modules_resource_remove_modules_delete},
      url: "/rest/atlassian-connect/1/app/module/dynamic",
      method: :delete,
      query: query,
      response: [{204, :null}, {401, {Jiramax.ErrorMessage, :t}}],
      opts: opts
    })
  end
end
