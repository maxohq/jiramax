defmodule Jiramax.AnnouncementBanner do
  @moduledoc """
  Provides API endpoints related to announcement banner
  """

  @default_client Jiramax.Client

  @doc """
  Get announcement banner configuration

  Returns the current announcement banner configuration.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec get_banner(keyword) ::
          {:ok, Jiramax.AnnouncementBannerConfiguration.t()}
          | {:error, Jiramax.ErrorCollection.t()}
  def get_banner(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.AnnouncementBanner, :get_banner},
      url: "/rest/api/3/announcementBanner",
      method: :get,
      response: [
        {200, {Jiramax.AnnouncementBannerConfiguration, :t}},
        {401, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update announcement banner configuration

  Updates the announcement banner configuration.

  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  """
  @spec set_banner(Jiramax.AnnouncementBannerConfigurationUpdate.t(), keyword) ::
          {:ok, map} | {:error, Jiramax.ErrorCollection.t()}
  def set_banner(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.AnnouncementBanner, :set_banner},
      url: "/rest/api/3/announcementBanner",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.AnnouncementBannerConfigurationUpdate, :t}}],
      response: [
        {204, :map},
        {400, {Jiramax.ErrorCollection, :t}},
        {401, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end
end
