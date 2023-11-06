defmodule Jiramax.IssueCustomFieldValuesApps do
  @moduledoc """
  Provides API endpoints related to issue custom field values apps
  """

  @default_client Jiramax.Client

  @doc """
  Update custom field value

  Updates the value of a custom field on one or more issues. Custom fields can only be updated by the Forge app that created them.

  **[Permissions](#permissions) required:** Only the app that created the custom field can update its values with this operation.

  ## Options

    * `generateChangelog`: Whether to generate a changelog for this update.

  """
  @spec update_custom_field_value(String.t(), Jiramax.CustomFieldValueUpdateDetails.t(), keyword) ::
          {:ok, map} | :error
  def update_custom_field_value(fieldIdOrKey, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:generateChangelog])

    client.request(%{
      args: [fieldIdOrKey: fieldIdOrKey, body: body],
      call: {Jiramax.IssueCustomFieldValuesApps, :update_custom_field_value},
      url: "/rest/api/3/app/field/#{fieldIdOrKey}/value",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", {Jiramax.CustomFieldValueUpdateDetails, :t}}],
      response: [{204, :map}, {400, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Update custom fields

  Updates the value of one or more custom fields on one or more issues. Combinations of custom field and issue should be unique within the request. Custom fields can only be updated by the Forge app that created them.

  **[Permissions](#permissions) required:** Only the app that created the custom field can update its values with this operation.

  ## Options

    * `generateChangelog`: Whether to generate a changelog for this update.

  """
  @spec update_multiple_custom_field_values(
          Jiramax.MultipleCustomFieldValuesUpdateDetails.t(),
          keyword
        ) :: {:ok, map} | :error
  def update_multiple_custom_field_values(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:generateChangelog])

    client.request(%{
      args: [body: body],
      call: {Jiramax.IssueCustomFieldValuesApps, :update_multiple_custom_field_values},
      url: "/rest/api/3/app/field/value",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Jiramax.MultipleCustomFieldValuesUpdateDetails, :t}}],
      response: [{204, :map}, {400, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
