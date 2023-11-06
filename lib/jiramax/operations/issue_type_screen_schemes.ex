defmodule Jiramax.IssueTypeScreenSchemes do
  @moduledoc """
  Provides API endpoints related to issue type screen schemes
  """

  @default_client Jiramax.Client

  @doc """
  Append mappings to issue type screen scheme

  Appends issue type to screen scheme mappings to an issue type screen scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec append_mappings_for_issue_type_screen_scheme(
          String.t(),
          Jiramax.IssueTypeScreenSchemeMappingDetails.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def append_mappings_for_issue_type_screen_scheme(issueTypeScreenSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId, body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :append_mappings_for_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}/mapping",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.IssueTypeScreenSchemeMappingDetails, :t}}],
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, :null},
        {404, {:const, nil}},
        {409, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Assign issue type screen scheme to project

  Assigns an issue type screen scheme to a project.

  Issue type screen schemes can only be assigned to classic projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec assign_issue_type_screen_scheme_to_project(
          Jiramax.IssueTypeScreenSchemeProjectAssociation.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def assign_issue_type_screen_scheme_to_project(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :assign_issue_type_screen_scheme_to_project},
      url: "/rest/api/3/issuetypescreenscheme/project",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.IssueTypeScreenSchemeProjectAssociation, :t}}],
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {404, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Create issue type screen scheme

  Creates an issue type screen scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_issue_type_screen_scheme(Jiramax.IssueTypeScreenSchemeDetails.t(), keyword) ::
          {:ok, Jiramax.IssueTypeScreenSchemeId.t()} | {:error, nil}
  def create_issue_type_screen_scheme(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :create_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.IssueTypeScreenSchemeDetails, :t}}],
      response: [
        {201, {Jiramax.IssueTypeScreenSchemeId, :t}},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {404, {:const, nil}},
        {409, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete issue type screen scheme

  Deletes an issue type screen scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec delete_issue_type_screen_scheme(String.t(), keyword) :: {:ok, map} | {:error, nil}
  def delete_issue_type_screen_scheme(issueTypeScreenSchemeId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId],
      call: {Jiramax.IssueTypeScreenSchemes, :delete_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}",
      method: :delete,
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, :null},
        {404, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type screen scheme items

  Returns a [paginated](#pagination) list of issue type screen scheme items.

  Only issue type screen schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `issueTypeScreenSchemeId`: The list of issue type screen scheme IDs. To include multiple issue type screen schemes, separate IDs with ampersand: `issueTypeScreenSchemeId=10000&issueTypeScreenSchemeId=10001`.

  """
  @spec get_issue_type_screen_scheme_mappings(keyword) ::
          {:ok, Jiramax.PageBeanIssueTypeScreenSchemeItem.t()} | :error
  def get_issue_type_screen_scheme_mappings(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:issueTypeScreenSchemeId, :maxResults, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeScreenSchemes, :get_issue_type_screen_scheme_mappings},
      url: "/rest/api/3/issuetypescreenscheme/mapping",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeScreenSchemeItem, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type screen schemes for projects

  Returns a [paginated](#pagination) list of issue type screen schemes and, for each issue type screen scheme, a list of the projects that use it.

  Only issue type screen schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `projectId`: The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`.

  """
  @spec get_issue_type_screen_scheme_project_associations(keyword) ::
          {:ok, Jiramax.PageBeanIssueTypeScreenSchemesProjects.t()} | :error
  def get_issue_type_screen_scheme_project_associations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :projectId, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeScreenSchemes, :get_issue_type_screen_scheme_project_associations},
      url: "/rest/api/3/issuetypescreenscheme/project",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeScreenSchemesProjects, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type screen schemes

  Returns a [paginated](#pagination) list of issue type screen schemes.

  Only issue type screen schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `id`: The list of issue type screen scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
    * `queryString`: String used to perform a case-insensitive partial match with issue type screen scheme name.
    * `orderBy`: [Order](#ordering) the results by a field:
      
       *  `name` Sorts by issue type screen scheme name.
       *  `id` Sorts by issue type screen scheme ID.
    * `expand`: Use [expand](#expansion) to include additional information in the response. This parameter accepts `projects` that, for each issue type screen schemes, returns information about the projects the issue type screen scheme is assigned to.

  """
  @spec get_issue_type_screen_schemes(keyword) ::
          {:ok, Jiramax.PageBeanIssueTypeScreenScheme.t()} | :error
  def get_issue_type_screen_schemes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:expand, :id, :maxResults, :orderBy, :queryString, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeScreenSchemes, :get_issue_type_screen_schemes},
      url: "/rest/api/3/issuetypescreenscheme",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeScreenScheme, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type screen scheme projects

  Returns a [paginated](#pagination) list of projects associated with an issue type screen scheme.

  Only company-managed projects associated with an issue type screen scheme are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `query`

  """
  @spec get_projects_for_issue_type_screen_scheme(integer, keyword) ::
          {:ok, Jiramax.PageBeanProjectDetails.t()} | :error
  def get_projects_for_issue_type_screen_scheme(issueTypeScreenSchemeId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :query, :startAt])

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId],
      call: {Jiramax.IssueTypeScreenSchemes, :get_projects_for_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}/project",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanProjectDetails, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Remove mappings from issue type screen scheme

  Removes issue type to screen scheme mappings from an issue type screen scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec remove_mappings_from_issue_type_screen_scheme(
          String.t(),
          Jiramax.IssueTypeIds.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def remove_mappings_from_issue_type_screen_scheme(issueTypeScreenSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId, body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :remove_mappings_from_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}/mapping/remove",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.IssueTypeIds, :t}}],
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {404, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Update issue type screen scheme default screen scheme

  Updates the default screen scheme of an issue type screen scheme. The default screen scheme is used for all unmapped issue types.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_default_screen_scheme(String.t(), Jiramax.UpdateDefaultScreenScheme.t(), keyword) ::
          {:ok, map} | {:error, nil}
  def update_default_screen_scheme(issueTypeScreenSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId, body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :update_default_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}/mapping/default",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.UpdateDefaultScreenScheme, :t}}],
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {404, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Update issue type screen scheme

  Updates an issue type screen scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_issue_type_screen_scheme(
          String.t(),
          Jiramax.IssueTypeScreenSchemeUpdateDetails.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def update_issue_type_screen_scheme(issueTypeScreenSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeScreenSchemeId: issueTypeScreenSchemeId, body: body],
      call: {Jiramax.IssueTypeScreenSchemes, :update_issue_type_screen_scheme},
      url: "/rest/api/3/issuetypescreenscheme/#{issueTypeScreenSchemeId}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.IssueTypeScreenSchemeUpdateDetails, :t}}],
      response: [
        {204, :map},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {404, {:const, nil}}
      ],
      opts: opts
    })
  end
end
