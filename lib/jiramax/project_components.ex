defmodule Jiramax.ProjectComponents do
  @moduledoc """
  Provides API endpoints related to project components
  """

  @default_client Jiramax.Client

  @doc """
  Create component

  Creates a component. Use components to provide containers for issues within a project. Use components to provide containers for issues within a project.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the component is created or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_component(Jiramax.ProjectComponent.t(), keyword) ::
          {:ok, Jiramax.ProjectComponent.t()} | :error
  def create_component(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.ProjectComponents, :create_component},
      url: "/rest/api/3/component",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.ProjectComponent, :t}}],
      response: [
        {201, {Jiramax.ProjectComponent, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Delete component

  Deletes a component.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the component or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `moveIssuesTo`: The ID of the component to replace the deleted component. If this value is null no replacement is made.

  """
  @spec delete_component(String.t(), keyword) :: :ok | :error
  def delete_component(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:moveIssuesTo])

    client.request(%{
      args: [id: id],
      call: {Jiramax.ProjectComponents, :delete_component},
      url: "/rest/api/3/component/#{id}",
      method: :delete,
      query: query,
      response: [{204, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get component

  Returns a component.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for project containing the component.
  """
  @spec get_component(String.t(), keyword) :: {:ok, Jiramax.ProjectComponent.t()} | :error
  def get_component(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.ProjectComponents, :get_component},
      url: "/rest/api/3/component/#{id}",
      method: :get,
      response: [{200, {Jiramax.ProjectComponent, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get component issues count

  Returns the counts of issues assigned to the component.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None.
  """
  @spec get_component_related_issues(String.t(), keyword) ::
          {:ok, Jiramax.ComponentIssuesCount.t()} | :error
  def get_component_related_issues(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.ProjectComponents, :get_component_related_issues},
      url: "/rest/api/3/component/#{id}/relatedIssueCounts",
      method: :get,
      response: [{200, {Jiramax.ComponentIssuesCount, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get project components

  Returns all components in a project. See the [Get project components paginated](#api-rest-api-3-project-projectIdOrKey-component-get) resource if you want to get a full list of components with pagination.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  """
  @spec get_project_components(String.t(), keyword) ::
          {:ok, [Jiramax.ProjectComponent.t()]} | :error
  def get_project_components(projectIdOrKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey],
      call: {Jiramax.ProjectComponents, :get_project_components},
      url: "/rest/api/3/project/#{projectIdOrKey}/components",
      method: :get,
      response: [{200, [{Jiramax.ProjectComponent, :t}]}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get project components paginated

  Returns a [paginated](#pagination) list of all components in a project. See the [Get project components](#api-rest-api-3-project-projectIdOrKey-components-get) resource if you want to get a full list of versions without pagination.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `orderBy`: [Order](#ordering) the results by a field:
      
       *  `description` Sorts by the component description.
       *  `issueCount` Sorts by the count of issues associated with the component.
       *  `lead` Sorts by the user key of the component's project lead.
       *  `name` Sorts by component name.
    * `query`: Filter the results using a literal string. Components with a matching `name` or `description` are returned (case insensitive).

  """
  @spec get_project_components_paginated(String.t(), keyword) ::
          {:ok, Jiramax.PageBeanComponentWithIssueCount.t()} | :error
  def get_project_components_paginated(projectIdOrKey, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :orderBy, :query, :startAt])

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey],
      call: {Jiramax.ProjectComponents, :get_project_components_paginated},
      url: "/rest/api/3/project/#{projectIdOrKey}/component",
      method: :get,
      query: query,
      response: [{200, {Jiramax.PageBeanComponentWithIssueCount, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update component

  Updates a component. Any fields included in the request are overwritten. If `leadAccountId` is an empty string ("") the component lead is removed.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the component or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_component(String.t(), Jiramax.ProjectComponent.t(), keyword) ::
          {:ok, Jiramax.ProjectComponent.t()} | :error
  def update_component(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.ProjectComponents, :update_component},
      url: "/rest/api/3/component/#{id}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.ProjectComponent, :t}}],
      response: [
        {200, {Jiramax.ProjectComponent, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end
end
