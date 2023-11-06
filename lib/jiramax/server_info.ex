defmodule Jiramax.ServerInfo do
  @moduledoc """
  Provides API endpoint related to server info
  """

  @default_client Jiramax.Client

  @doc """
  Get Jira instance info

  Returns information about the Jira instance.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None.
  """
  @spec get_server_info(keyword) :: {:ok, Jiramax.ServerInformation.t()} | :error
  def get_server_info(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.ServerInfo, :get_server_info},
      url: "/rest/api/3/serverInfo",
      method: :get,
      response: [{200, {Jiramax.ServerInformation, :t}}, {401, :null}],
      opts: opts
    })
  end
end
