defmodule Jiramax.ProjectCategories do
  @moduledoc """
  Provides API endpoints related to project categories
  """

  @default_client Jiramax.Client

  @doc """
  Create project category

  Creates a project category.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_project_category(Jiramax.ProjectCategory.t(), keyword) ::
          {:ok, Jiramax.ProjectCategory.t()} | :error
  def create_project_category(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.ProjectCategories, :create_project_category},
      url: "/rest/api/3/projectCategory",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.ProjectCategory, :t}}],
      response: [
        {201, {Jiramax.ProjectCategory, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {409, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get all project categories

  Returns all project categories.

  **[Permissions](#permissions) required:** Permission to access Jira.
  """
  @spec get_all_project_categories(keyword) :: {:ok, [Jiramax.ProjectCategory.t()]} | :error
  def get_all_project_categories(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.ProjectCategories, :get_all_project_categories},
      url: "/rest/api/3/projectCategory",
      method: :get,
      response: [{200, [{Jiramax.ProjectCategory, :t}]}, {401, :null}],
      opts: opts
    })
  end

  @doc """
  Get project category by ID

  Returns a project category.

  **[Permissions](#permissions) required:** Permission to access Jira.
  """
  @spec get_project_category_by_id(integer, keyword) ::
          {:ok, Jiramax.ProjectCategory.t()} | :error
  def get_project_category_by_id(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.ProjectCategories, :get_project_category_by_id},
      url: "/rest/api/3/projectCategory/#{id}",
      method: :get,
      response: [{200, {Jiramax.ProjectCategory, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Delete project category

  Deletes a project category.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec remove_project_category(integer, keyword) :: :ok | :error
  def remove_project_category(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.ProjectCategories, :remove_project_category},
      url: "/rest/api/3/projectCategory/#{id}",
      method: :delete,
      response: [{204, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update project category

  Updates a project category.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_project_category(integer, Jiramax.ProjectCategory.t(), keyword) ::
          {:ok, Jiramax.UpdatedProjectCategory.t()} | :error
  def update_project_category(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.ProjectCategories, :update_project_category},
      url: "/rest/api/3/projectCategory/#{id}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.ProjectCategory, :t}}],
      response: [
        {200, {Jiramax.UpdatedProjectCategory, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end
end
