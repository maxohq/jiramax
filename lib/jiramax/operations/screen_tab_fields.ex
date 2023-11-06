defmodule Jiramax.ScreenTabFields do
  @moduledoc """
  Provides API endpoints related to screen tab fields
  """

  @default_client Jiramax.Client

  @doc """
  Add screen tab field

  Adds a field to a screen tab.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec add_screen_tab_field(integer, integer, Jiramax.AddFieldBean.t(), keyword) ::
          {:ok, Jiramax.ScreenableField.t()} | :error
  def add_screen_tab_field(screenId, tabId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [screenId: screenId, tabId: tabId, body: body],
      call: {Jiramax.ScreenTabFields, :add_screen_tab_field},
      url: "/rest/api/3/screens/#{screenId}/tabs/#{tabId}/fields",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.AddFieldBean, :t}}],
      response: [
        {200, {Jiramax.ScreenableField, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get all screen tab fields

  Returns all fields for a screen tab.

  **[Permissions](#permissions) required:**

   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
   *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.

  ## Options

    * `projectKey`: The key of the project.

  """
  @spec get_all_screen_tab_fields(integer, integer, keyword) ::
          {:ok, [Jiramax.ScreenableField.t()]} | :error
  def get_all_screen_tab_fields(screenId, tabId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:projectKey])

    client.request(%{
      args: [screenId: screenId, tabId: tabId],
      call: {Jiramax.ScreenTabFields, :get_all_screen_tab_fields},
      url: "/rest/api/3/screens/#{screenId}/tabs/#{tabId}/fields",
      method: :get,
      query: query,
      response: [{200, [{Jiramax.ScreenableField, :t}]}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Move screen tab field

  Moves a screen tab field.

  If `after` and `position` are provided in the request, `position` is ignored.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec move_screen_tab_field(integer, integer, String.t(), Jiramax.MoveFieldBean.t(), keyword) ::
          {:ok, map} | :error
  def move_screen_tab_field(screenId, tabId, id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [screenId: screenId, tabId: tabId, id: id, body: body],
      call: {Jiramax.ScreenTabFields, :move_screen_tab_field},
      url: "/rest/api/3/screens/#{screenId}/tabs/#{tabId}/fields/#{id}/move",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.MoveFieldBean, :t}}],
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Remove screen tab field

  Removes a field from a screen tab.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec remove_screen_tab_field(integer, integer, String.t(), keyword) :: :ok | :error
  def remove_screen_tab_field(screenId, tabId, id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [screenId: screenId, tabId: tabId, id: id],
      call: {Jiramax.ScreenTabFields, :remove_screen_tab_field},
      url: "/rest/api/3/screens/#{screenId}/tabs/#{tabId}/fields/#{id}",
      method: :delete,
      response: [{204, :null}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
