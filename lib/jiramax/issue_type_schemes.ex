defmodule Jiramax.IssueTypeSchemes do
  @moduledoc """
  Provides API endpoints related to issue type schemes
  """

  @default_client Jiramax.Client

  @doc """
  Add issue types to issue type scheme

  Adds issue types to an issue type scheme.

  The added issue types are appended to the issue types list.

  If any of the issue types exist in the issue type scheme, the operation fails and no issue types are added.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec add_issue_types_to_issue_type_scheme(integer, Jiramax.IssueTypeIds.t(), keyword) ::
          {:ok, map} | {:error, nil}
  def add_issue_types_to_issue_type_scheme(issueTypeSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeSchemeId: issueTypeSchemeId, body: body],
      call: {Jiramax.IssueTypeSchemes, :add_issue_types_to_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme/#{issueTypeSchemeId}/issuetype",
      body: body,
      method: :put,
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
  Assign issue type scheme to project

  Assigns an issue type scheme to a project.

  If any issues in the project are assigned issue types not present in the new scheme, the operation will fail. To complete the assignment those issues must be updated to use issue types in the new scheme.

  Issue type schemes can only be assigned to classic projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec assign_issue_type_scheme_to_project(
          Jiramax.IssueTypeSchemeProjectAssociation.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def assign_issue_type_scheme_to_project(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueTypeSchemes, :assign_issue_type_scheme_to_project},
      url: "/rest/api/3/issuetypescheme/project",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.IssueTypeSchemeProjectAssociation, :t}}],
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
  Create issue type scheme

  Creates an issue type scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_issue_type_scheme(Jiramax.IssueTypeSchemeDetails.t(), keyword) ::
          {:ok, Jiramax.IssueTypeSchemeId.t()} | {:error, nil}
  def create_issue_type_scheme(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueTypeSchemes, :create_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.IssueTypeSchemeDetails, :t}}],
      response: [
        {201, {Jiramax.IssueTypeSchemeId, :t}},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}},
        {409, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete issue type scheme

  Deletes an issue type scheme.

  Only issue type schemes used in classic projects can be deleted.

  Any projects assigned to the scheme are reassigned to the default issue type scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec delete_issue_type_scheme(integer, keyword) :: {:ok, map} | {:error, nil}
  def delete_issue_type_scheme(issueTypeSchemeId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeSchemeId: issueTypeSchemeId],
      call: {Jiramax.IssueTypeSchemes, :delete_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme/#{issueTypeSchemeId}",
      method: :delete,
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
  Get all issue type schemes

  Returns a [paginated](#pagination) list of issue type schemes.

  Only issue type schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `id`: The list of issue type schemes IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
    * `orderBy`: [Order](#ordering) the results by a field:
      
       *  `name` Sorts by issue type scheme name.
       *  `id` Sorts by issue type scheme ID.
    * `expand`: Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:
      
       *  `projects` For each issue type schemes, returns information about the projects the issue type scheme is assigned to.
       *  `issueTypes` For each issue type schemes, returns information about the issueTypes the issue type scheme have.
    * `queryString`: String used to perform a case-insensitive partial match with issue type scheme name.

  """
  @spec get_all_issue_type_schemes(keyword) :: {:ok, Jiramax.PageBeanIssueTypeScheme.t()} | :error
  def get_all_issue_type_schemes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:expand, :id, :maxResults, :orderBy, :queryString, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeSchemes, :get_all_issue_type_schemes},
      url: "/rest/api/3/issuetypescheme",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeScheme, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type schemes for projects

  Returns a [paginated](#pagination) list of issue type schemes and, for each issue type scheme, a list of the projects that use it.

  Only issue type schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `projectId`: The list of project IDs. To include multiple project IDs, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`.

  """
  @spec get_issue_type_scheme_for_projects(keyword) ::
          {:ok, Jiramax.PageBeanIssueTypeSchemeProjects.t()} | :error
  def get_issue_type_scheme_for_projects(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :projectId, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeSchemes, :get_issue_type_scheme_for_projects},
      url: "/rest/api/3/issuetypescheme/project",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeSchemeProjects, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get issue type scheme items

  Returns a [paginated](#pagination) list of issue type scheme items.

  Only issue type scheme items used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `issueTypeSchemeId`: The list of issue type scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `issueTypeSchemeId=10000&issueTypeSchemeId=10001`.

  """
  @spec get_issue_type_schemes_mapping(keyword) ::
          {:ok, Jiramax.PageBeanIssueTypeSchemeMapping.t()} | :error
  def get_issue_type_schemes_mapping(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:issueTypeSchemeId, :maxResults, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueTypeSchemes, :get_issue_type_schemes_mapping},
      url: "/rest/api/3/issuetypescheme/mapping",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanIssueTypeSchemeMapping, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Remove issue type from issue type scheme

  Removes an issue type from an issue type scheme.

  This operation cannot remove:

   *  any issue type used by issues.
   *  any issue types from the default issue type scheme.
   *  the last standard issue type from an issue type scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec remove_issue_type_from_issue_type_scheme(integer, integer, keyword) ::
          {:ok, map} | {:error, nil}
  def remove_issue_type_from_issue_type_scheme(issueTypeSchemeId, issueTypeId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeSchemeId: issueTypeSchemeId, issueTypeId: issueTypeId],
      call: {Jiramax.IssueTypeSchemes, :remove_issue_type_from_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme/#{issueTypeSchemeId}/issuetype/#{issueTypeId}",
      method: :delete,
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
  Change order of issue types

  Changes the order of issue types in an issue type scheme.

  The request body parameters must meet the following requirements:

   *  all of the issue types must belong to the issue type scheme.
   *  either `after` or `position` must be provided.
   *  the issue type in `after` must not be in the issue type list.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec reorder_issue_types_in_issue_type_scheme(integer, Jiramax.OrderOfIssueTypes.t(), keyword) ::
          {:ok, map} | {:error, nil}
  def reorder_issue_types_in_issue_type_scheme(issueTypeSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeSchemeId: issueTypeSchemeId, body: body],
      call: {Jiramax.IssueTypeSchemes, :reorder_issue_types_in_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme/#{issueTypeSchemeId}/issuetype/move",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.OrderOfIssueTypes, :t}}],
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
  Update issue type scheme

  Updates an issue type scheme.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_issue_type_scheme(integer, Jiramax.IssueTypeSchemeUpdateDetails.t(), keyword) ::
          {:ok, map} | {:error, nil}
  def update_issue_type_scheme(issueTypeSchemeId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeSchemeId: issueTypeSchemeId, body: body],
      call: {Jiramax.IssueTypeSchemes, :update_issue_type_scheme},
      url: "/rest/api/3/issuetypescheme/#{issueTypeSchemeId}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.IssueTypeSchemeUpdateDetails, :t}}],
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
