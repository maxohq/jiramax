defmodule Jiramax.Webhooks do
  @moduledoc """
  Provides API endpoints related to webhooks
  """

  @default_client Jiramax.Client

  @doc """
  Delete webhooks by ID

  Removes webhooks by ID. Only webhooks registered by the calling app are removed. If webhooks created by other apps are specified, they are ignored.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/#connect-apps) and [OAuth 2.0](https://developer.atlassian.com/cloud/jira/platform/oauth-2-3lo-apps) apps can use this operation.
  """
  @spec delete_webhook_by_id(Jiramax.ContainerForWebhookIds.t(), keyword) ::
          :ok | {:error, Jiramax.ErrorCollection.t()}
  def delete_webhook_by_id(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.Webhooks, :delete_webhook_by_id},
      url: "/rest/api/3/webhook",
      body: body,
      method: :delete,
      request: [{"application/json", {Jiramax.ContainerForWebhookIds, :t}}],
      response: [
        {202, :null},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get dynamic webhooks for app

  Returns a [paginated](#pagination) list of the webhooks registered by the calling app.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/#connect-apps) and [OAuth 2.0](https://developer.atlassian.com/cloud/jira/platform/oauth-2-3lo-apps) apps can use this operation.

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.

  """
  @spec get_dynamic_webhooks_for_app(keyword) ::
          {:ok, Jiramax.PageBeanWebhook.t()} | {:error, Jiramax.ErrorCollection.t()}
  def get_dynamic_webhooks_for_app(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:maxResults, :startAt])

    client.request(%{
      args: [],
      call: {Jiramax.Webhooks, :get_dynamic_webhooks_for_app},
      url: "/rest/api/3/webhook",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanWebhook, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get failed webhooks

  Returns webhooks that have recently failed to be delivered to the requesting app after the maximum number of retries.

  After 72 hours the failure may no longer be returned by this operation.

  The oldest failure is returned first.

  This method uses a cursor-based pagination. To request the next page use the failure time of the last webhook on the list as the `failedAfter` value or use the URL provided in `next`.

  **[Permissions](#permissions) required:** Only [Connect apps](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) can use this operation.

  ## Options

    * `maxResults`: The maximum number of webhooks to return per page. If obeying the maxResults directive would result in records with the same failure time being split across pages, the directive is ignored and all records with the same failure time included on the page.
    * `after`: The time after which any webhook failure must have occurred for the record to be returned, expressed as milliseconds since the UNIX epoch.

  """
  @spec get_failed_webhooks(keyword) ::
          {:ok, Jiramax.FailedWebhooks.t()} | {:error, Jiramax.ErrorCollection.t()}
  def get_failed_webhooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :maxResults])

    client.request(%{
      args: [],
      call: {Jiramax.Webhooks, :get_failed_webhooks},
      url: "/rest/api/3/webhook/failed",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.FailedWebhooks, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Extend webhook life

  Extends the life of webhook. Webhooks registered through the REST API expire after 30 days. Call this operation to keep them alive.

  Unrecognized webhook IDs (those that are not found or belong to other apps) are ignored.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/#connect-apps) and [OAuth 2.0](https://developer.atlassian.com/cloud/jira/platform/oauth-2-3lo-apps) apps can use this operation.
  """
  @spec refresh_webhooks(Jiramax.ContainerForWebhookIds.t(), keyword) ::
          {:ok, Jiramax.WebhooksExpirationDate.t()} | {:error, Jiramax.ErrorCollection.t()}
  def refresh_webhooks(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.Webhooks, :refresh_webhooks},
      url: "/rest/api/3/webhook/refresh",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.ContainerForWebhookIds, :t}}],
      response: [
        {200, {Jiramax.WebhooksExpirationDate, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Register dynamic webhooks

  Registers webhooks.

  **NOTE:** for non-public OAuth apps, webhooks are delivered only if there is a match between the app owner and the user who registered a dynamic webhook.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/#connect-apps) and [OAuth 2.0](https://developer.atlassian.com/cloud/jira/platform/oauth-2-3lo-apps) apps can use this operation.
  """
  @spec register_dynamic_webhooks(Jiramax.WebhookRegistrationDetails.t(), keyword) ::
          {:ok, Jiramax.ContainerForRegisteredWebhooks.t()}
          | {:error, Jiramax.ErrorCollection.t()}
  def register_dynamic_webhooks(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.Webhooks, :register_dynamic_webhooks},
      url: "/rest/api/3/webhook",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.WebhookRegistrationDetails, :t}}],
      response: [
        {200, {Jiramax.ContainerForRegisteredWebhooks, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end
end
