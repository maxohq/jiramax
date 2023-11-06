defmodule Jiramax.ProjectTypes do
  @moduledoc """
  Provides API endpoints related to project types
  """

  @default_client Jiramax.Client

  @doc """
  Get accessible project type by key

  Returns a [project type](https://confluence.atlassian.com/x/Var1Nw) if it is accessible to the user.

  **[Permissions](#permissions) required:** Permission to access Jira.
  """
  @spec get_accessible_project_type_by_key(String.t(), keyword) ::
          {:ok, Jiramax.ProjectType.t()} | :error
  def get_accessible_project_type_by_key(projectTypeKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectTypeKey: projectTypeKey],
      call: {Jiramax.ProjectTypes, :get_accessible_project_type_by_key},
      url: "/rest/api/3/project/type/#{projectTypeKey}/accessible",
      method: :get,
      response: [{200, {Jiramax.ProjectType, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get licensed project types

  Returns all [project types](https://confluence.atlassian.com/x/Var1Nw) with a valid license.
  """
  @spec get_all_accessible_project_types(keyword) :: {:ok, [Jiramax.ProjectType.t()]} | :error
  def get_all_accessible_project_types(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.ProjectTypes, :get_all_accessible_project_types},
      url: "/rest/api/3/project/type/accessible",
      method: :get,
      response: [{200, [{Jiramax.ProjectType, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get all project types

  Returns all [project types](https://confluence.atlassian.com/x/Var1Nw), whether or not the instance has a valid license for each type.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None.
  """
  @spec get_all_project_types(keyword) :: {:ok, [Jiramax.ProjectType.t()]} | :error
  def get_all_project_types(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.ProjectTypes, :get_all_project_types},
      url: "/rest/api/3/project/type",
      method: :get,
      response: [{200, [{Jiramax.ProjectType, :t}]}, {401, :null}],
      opts: opts
    })
  end

  @doc """
  Get project type by key

  Returns a [project type](https://confluence.atlassian.com/x/Var1Nw).

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None.
  """
  @spec get_project_type_by_key(String.t(), keyword) :: {:ok, Jiramax.ProjectType.t()} | :error
  def get_project_type_by_key(projectTypeKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectTypeKey: projectTypeKey],
      call: {Jiramax.ProjectTypes, :get_project_type_by_key},
      url: "/rest/api/3/project/type/#{projectTypeKey}",
      method: :get,
      response: [{200, {Jiramax.ProjectType, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end
end
