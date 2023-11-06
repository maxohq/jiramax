defmodule Jiramax.ProjectProperties do
  @moduledoc """
  Provides API endpoints related to project properties
  """

  @default_client Jiramax.Client

  @doc """
  Delete project property

  Deletes the [property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) from a project.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  """
  @spec delete_project_property(String.t(), String.t(), keyword) :: :ok | :error
  def delete_project_property(projectIdOrKey, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey, propertyKey: propertyKey],
      call: {Jiramax.ProjectProperties, :delete_project_property},
      url: "/rest/api/3/project/#{projectIdOrKey}/properties/#{propertyKey}",
      method: :delete,
      response: [{204, :null}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get project property

  Returns the value of a [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  """
  @spec get_project_property(String.t(), String.t(), keyword) ::
          {:ok, Jiramax.EntityProperty.t()} | :error
  def get_project_property(projectIdOrKey, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey, propertyKey: propertyKey],
      call: {Jiramax.ProjectProperties, :get_project_property},
      url: "/rest/api/3/project/#{projectIdOrKey}/properties/#{propertyKey}",
      method: :get,
      response: [
        {200, {Jiramax.EntityProperty, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get project property keys

  Returns all [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys for the project.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  """
  @spec get_project_property_keys(String.t(), keyword) :: {:ok, Jiramax.PropertyKeys.t()} | :error
  def get_project_property_keys(projectIdOrKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey],
      call: {Jiramax.ProjectProperties, :get_project_property_keys},
      url: "/rest/api/3/project/#{projectIdOrKey}/properties",
      method: :get,
      response: [
        {200, {Jiramax.PropertyKeys, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Set project property

  Sets the value of the [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). You can use project properties to store custom data against the project.

  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the property is created.
  """
  @spec set_project_property(String.t(), String.t(), map, keyword) :: {:ok, map} | :error
  def set_project_property(projectIdOrKey, propertyKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey, propertyKey: propertyKey, body: body],
      call: {Jiramax.ProjectProperties, :set_project_property},
      url: "/rest/api/3/project/#{projectIdOrKey}/properties/#{propertyKey}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, :map}, {201, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
