defmodule Jiramax.IssueTypeProperties do
  @moduledoc """
  Provides API endpoints related to issue type properties
  """

  @default_client Jiramax.Client

  @doc """
  Delete issue type property

  Deletes the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec delete_issue_type_property(String.t(), String.t(), keyword) :: :ok | :error
  def delete_issue_type_property(issueTypeId, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeId: issueTypeId, propertyKey: propertyKey],
      call: {Jiramax.IssueTypeProperties, :delete_issue_type_property},
      url: "/rest/api/3/issuetype/#{issueTypeId}/properties/#{propertyKey}",
      method: :delete,
      response: [{204, :null}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get issue type property

  Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:**

   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.
  """
  @spec get_issue_type_property(String.t(), String.t(), keyword) ::
          {:ok, Jiramax.EntityProperty.t()} | :error
  def get_issue_type_property(issueTypeId, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeId: issueTypeId, propertyKey: propertyKey],
      call: {Jiramax.IssueTypeProperties, :get_issue_type_property},
      url: "/rest/api/3/issuetype/#{issueTypeId}/properties/#{propertyKey}",
      method: :get,
      response: [{200, {Jiramax.EntityProperty, :t}}, {400, :null}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get issue type property keys

  Returns all the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys of the issue type.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:**

   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the property keys of any issue type.
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the property keys of any issue types associated with the projects the user has permission to browse.
  """
  @spec get_issue_type_property_keys(String.t(), keyword) ::
          {:ok, Jiramax.PropertyKeys.t()} | :error
  def get_issue_type_property_keys(issueTypeId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeId: issueTypeId],
      call: {Jiramax.IssueTypeProperties, :get_issue_type_property_keys},
      url: "/rest/api/3/issuetype/#{issueTypeId}/properties",
      method: :get,
      response: [{200, {Jiramax.PropertyKeys, :t}}, {400, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Set issue type property

  Creates or updates the value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). Use this resource to store and update data against an issue type.

  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec set_issue_type_property(String.t(), String.t(), map, keyword) :: {:ok, map} | :error
  def set_issue_type_property(issueTypeId, propertyKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [issueTypeId: issueTypeId, propertyKey: propertyKey, body: body],
      call: {Jiramax.IssueTypeProperties, :set_issue_type_property},
      url: "/rest/api/3/issuetype/#{issueTypeId}/properties/#{propertyKey}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, :map}, {201, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
