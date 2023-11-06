defmodule Jiramax.IssueFieldConfigurations do
  @moduledoc """
  Provides API endpoints related to issue field configurations
  """

  @default_client Jiramax.Client

  @doc """
  Assign field configuration scheme to project

  Assigns a field configuration scheme to a project. If the field configuration scheme ID is `null`, the operation assigns the default field configuration scheme.

  Field configuration schemes can only be assigned to classic projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec assign_field_configuration_scheme_to_project(
          Jiramax.FieldConfigurationSchemeProjectAssociation.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def assign_field_configuration_scheme_to_project(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueFieldConfigurations, :assign_field_configuration_scheme_to_project},
      url: "/rest/api/3/fieldconfigurationscheme/project",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.FieldConfigurationSchemeProjectAssociation, :t}}],
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
  Create field configuration

  Creates a field configuration. The field configuration is created with the same field properties as the default configuration, with all the fields being optional.

  This operation can only create configurations for use in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_field_configuration(Jiramax.FieldConfigurationDetails.t(), keyword) ::
          {:ok, Jiramax.FieldConfiguration.t()} | :error
  def create_field_configuration(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueFieldConfigurations, :create_field_configuration},
      url: "/rest/api/3/fieldconfiguration",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.FieldConfigurationDetails, :t}}],
      response: [
        {200, {Jiramax.FieldConfiguration, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Create field configuration scheme

  Creates a field configuration scheme.

  This operation can only create field configuration schemes used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec create_field_configuration_scheme(
          Jiramax.UpdateFieldConfigurationSchemeDetails.t(),
          keyword
        ) :: {:ok, Jiramax.FieldConfigurationScheme.t()} | {:error, nil}
  def create_field_configuration_scheme(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueFieldConfigurations, :create_field_configuration_scheme},
      url: "/rest/api/3/fieldconfigurationscheme",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.UpdateFieldConfigurationSchemeDetails, :t}}],
      response: [
        {201, {Jiramax.FieldConfigurationScheme, :t}},
        {400, {:const, nil}},
        {401, :null},
        {403, {:const, nil}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete field configuration

  Deletes a field configuration.

  This operation can only delete configurations used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec delete_field_configuration(integer, keyword) :: {:ok, map} | :error
  def delete_field_configuration(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.IssueFieldConfigurations, :delete_field_configuration},
      url: "/rest/api/3/fieldconfiguration/#{id}",
      method: :delete,
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Delete field configuration scheme

  Deletes a field configuration scheme.

  This operation can only delete field configuration schemes used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec delete_field_configuration_scheme(integer, keyword) :: {:ok, map} | :error
  def delete_field_configuration_scheme(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.IssueFieldConfigurations, :delete_field_configuration_scheme},
      url: "/rest/api/3/fieldconfigurationscheme/#{id}",
      method: :delete,
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get all field configuration schemes

  Returns a [paginated](#pagination) list of field configuration schemes.

  Only field configuration schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `id`: The list of field configuration scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.

  """
  @spec get_all_field_configuration_schemes(keyword) ::
          {:ok, Jiramax.PageBeanFieldConfigurationScheme.t()} | :error
  def get_all_field_configuration_schemes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id, :maxResults, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueFieldConfigurations, :get_all_field_configuration_schemes},
      url: "/rest/api/3/fieldconfigurationscheme",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanFieldConfigurationScheme, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get all field configurations

  Returns a [paginated](#pagination) list of field configurations. The list can be for all field configurations or a subset determined by any combination of these criteria:

   *  a list of field configuration item IDs.
   *  whether the field configuration is a default.
   *  whether the field configuration name or description contains a query string.

  Only field configurations used in company-managed (classic) projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `id`: The list of field configuration IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
    * `isDefault`: If *true* returns default field configurations only.
    * `query`: The query string used to match against field configuration names and descriptions.

  """
  @spec get_all_field_configurations(keyword) ::
          {:ok, Jiramax.PageBeanFieldConfigurationDetails.t()} | :error
  def get_all_field_configurations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id, :isDefault, :maxResults, :query, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueFieldConfigurations, :get_all_field_configurations},
      url: "/rest/api/3/fieldconfiguration",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanFieldConfigurationDetails, :t}},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get field configuration items

  Returns a [paginated](#pagination) list of all fields for a configuration.

  Only the fields from configurations used in company-managed (classic) projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.

  """
  @spec get_field_configuration_items(integer, keyword) ::
          {:ok, Jiramax.PageBeanFieldConfigurationItem.t()} | :error
  def get_field_configuration_items(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :startAt])

    client.request(%{
      args: [id: id],
      call: {Jiramax.IssueFieldConfigurations, :get_field_configuration_items},
      url: "/rest/api/3/fieldconfiguration/#{id}/fields",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanFieldConfigurationItem, :t}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get field configuration issue type items

  Returns a [paginated](#pagination) list of field configuration issue type items.

  Only items used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `fieldConfigurationSchemeId`: The list of field configuration scheme IDs. To include multiple field configuration schemes separate IDs with ampersand: `fieldConfigurationSchemeId=10000&fieldConfigurationSchemeId=10001`.

  """
  @spec get_field_configuration_scheme_mappings(keyword) ::
          {:ok, Jiramax.PageBeanFieldConfigurationIssueTypeItem.t()} | :error
  def get_field_configuration_scheme_mappings(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:fieldConfigurationSchemeId, :maxResults, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueFieldConfigurations, :get_field_configuration_scheme_mappings},
      url: "/rest/api/3/fieldconfigurationscheme/mapping",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanFieldConfigurationIssueTypeItem, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get field configuration schemes for projects

  Returns a [paginated](#pagination) list of field configuration schemes and, for each scheme, a list of the projects that use it.

  The list is sorted by field configuration scheme ID. The first item contains the list of project IDs assigned to the default field configuration scheme.

  Only field configuration schemes used in classic projects are returned.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `projectId`: The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`.

  """
  @spec get_field_configuration_scheme_project_mapping(keyword) ::
          {:ok, Jiramax.PageBeanFieldConfigurationSchemeProjects.t()} | :error
  def get_field_configuration_scheme_project_mapping(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :projectId, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.IssueFieldConfigurations, :get_field_configuration_scheme_project_mapping},
      url: "/rest/api/3/fieldconfigurationscheme/project",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanFieldConfigurationSchemeProjects, :t}},
        {400, :null},
        {401, :null},
        {403, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Remove issue types from field configuration scheme

  Removes issue types from the field configuration scheme.

  This operation can only modify field configuration schemes used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec remove_issue_types_from_global_field_configuration_scheme(
          integer,
          Jiramax.IssueTypeIdsToRemove.t(),
          keyword
        ) :: {:ok, map} | {:error, Jiramax.ErrorCollection.t()}
  def remove_issue_types_from_global_field_configuration_scheme(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call:
        {Jiramax.IssueFieldConfigurations,
         :remove_issue_types_from_global_field_configuration_scheme},
      url: "/rest/api/3/fieldconfigurationscheme/#{id}/mapping/delete",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.IssueTypeIdsToRemove, :t}}],
      response: [
        {204, :map},
        {400, {Jiramax.ErrorCollection, :t}},
        {401, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}},
        {404, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Assign issue types to field configurations

  Assigns issue types to field configurations on field configuration scheme.

  This operation can only modify field configuration schemes used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec set_field_configuration_scheme_mapping(
          integer,
          Jiramax.AssociateFieldConfigurationsWithIssueTypesRequest.t(),
          keyword
        ) :: {:ok, map} | :error
  def set_field_configuration_scheme_mapping(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.IssueFieldConfigurations, :set_field_configuration_scheme_mapping},
      url: "/rest/api/3/fieldconfigurationscheme/#{id}/mapping",
      body: body,
      method: :put,
      request: [
        {"application/json", {Jiramax.AssociateFieldConfigurationsWithIssueTypesRequest, :t}}
      ],
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update field configuration

  Updates a field configuration. The name and the description provided in the request override the existing values.

  This operation can only update configurations used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_field_configuration(integer, Jiramax.FieldConfigurationDetails.t(), keyword) ::
          {:ok, map} | :error
  def update_field_configuration(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.IssueFieldConfigurations, :update_field_configuration},
      url: "/rest/api/3/fieldconfiguration/#{id}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.FieldConfigurationDetails, :t}}],
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update field configuration items

  Updates fields in a field configuration. The properties of the field configuration fields provided override the existing values.

  This operation can only update field configurations used in company-managed (classic) projects.

  The operation can set the renderer for text fields to the default text renderer (`text-renderer`) or wiki style renderer (`wiki-renderer`). However, the renderer cannot be updated for fields using the autocomplete renderer (`autocomplete-renderer`).

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_field_configuration_items(
          integer,
          Jiramax.FieldConfigurationItemsDetails.t(),
          keyword
        ) :: {:ok, map} | :error
  def update_field_configuration_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.IssueFieldConfigurations, :update_field_configuration_items},
      url: "/rest/api/3/fieldconfiguration/#{id}/fields",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.FieldConfigurationItemsDetails, :t}}],
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update field configuration scheme

  Updates a field configuration scheme.

  This operation can only update field configuration schemes used in company-managed (classic) projects.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec update_field_configuration_scheme(
          integer,
          Jiramax.UpdateFieldConfigurationSchemeDetails.t(),
          keyword
        ) :: {:ok, map} | {:error, nil}
  def update_field_configuration_scheme(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.IssueFieldConfigurations, :update_field_configuration_scheme},
      url: "/rest/api/3/fieldconfigurationscheme/#{id}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.UpdateFieldConfigurationSchemeDetails, :t}}],
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
