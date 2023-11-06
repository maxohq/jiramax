defmodule Jiramax.ApplicationRoles do
  @moduledoc """
  Provides API endpoints related to application roles
  """

  @default_client Jiramax.Client

  @doc """
  Get all application roles

  Returns all application roles. In Jira, application roles are managed using the [Application access configuration](https://confluence.atlassian.com/x/3YxjL) page.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec get_all_application_roles(keyword) :: {:ok, [Jiramax.ApplicationRole.t()]} | :error
  def get_all_application_roles(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.ApplicationRoles, :get_all_application_roles},
      url: "/rest/api/3/applicationrole",
      method: :get,
      response: [{200, [{Jiramax.ApplicationRole, :t}]}, {401, :null}, {403, :null}],
      opts: opts
    })
  end

  @doc """
  Get application role

  Returns an application role.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec get_application_role(String.t(), keyword) :: {:ok, Jiramax.ApplicationRole.t()} | :error
  def get_application_role(key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key: key],
      call: {Jiramax.ApplicationRoles, :get_application_role},
      url: "/rest/api/3/applicationrole/#{key}",
      method: :get,
      response: [{200, {Jiramax.ApplicationRole, :t}}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
