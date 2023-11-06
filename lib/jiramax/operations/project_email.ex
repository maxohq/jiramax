defmodule Jiramax.ProjectEmail do
  @moduledoc """
  Provides API endpoints related to project email
  """

  @default_client Jiramax.Client

  @doc """
  Get project's sender email

  Returns the [project's sender email address](https://confluence.atlassian.com/x/dolKLg).

  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  """
  @spec get_project_email(integer, keyword) :: {:ok, Jiramax.ProjectEmailAddress.t()} | :error
  def get_project_email(projectId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectId: projectId],
      call: {Jiramax.ProjectEmail, :get_project_email},
      url: "/rest/api/3/project/#{projectId}/email",
      method: :get,
      response: [
        {200, {Jiramax.ProjectEmailAddress, :t}},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Set project's sender email

  Sets the [project's sender email address](https://confluence.atlassian.com/x/dolKLg).

  If `emailAddress` is an empty string, the default email address is restored.

  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  """
  @spec update_project_email(integer, Jiramax.ProjectEmailAddress.t(), keyword) ::
          {:ok, map} | :error
  def update_project_email(projectId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectId: projectId, body: body],
      call: {Jiramax.ProjectEmail, :update_project_email},
      url: "/rest/api/3/project/#{projectId}/email",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.ProjectEmailAddress, :t}}],
      response: [{204, :map}, {400, :null}, {401, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
