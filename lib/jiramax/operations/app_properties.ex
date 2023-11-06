defmodule Jiramax.AppProperties do
  @moduledoc """
  Provides API endpoints related to app properties
  """

  @default_client Jiramax.Client

  @doc """
  Delete app property

  Deletes an app's property.

  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
  """
  @spec addon_properties_resource_delete_addon_property_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, Jiramax.OperationMessage.t()}
  def addon_properties_resource_delete_addon_property_delete(addonKey, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [addonKey: addonKey, propertyKey: propertyKey],
      call: {Jiramax.AppProperties, :addon_properties_resource_delete_addon_property_delete},
      url: "/rest/atlassian-connect/1/addons/#{addonKey}/properties/#{propertyKey}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Jiramax.OperationMessage, :t}},
        {401, {Jiramax.OperationMessage, :t}},
        {404, {Jiramax.OperationMessage, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete app property (Forge)

  Deletes a Forge app's property.

  **[Permissions](#permissions) required:** Only Forge apps can make this request.
  """
  @spec addon_properties_resource_delete_app_property_delete(String.t(), keyword) ::
          :ok | {:error, Jiramax.OperationMessage.t() | nil}
  def addon_properties_resource_delete_app_property_delete(propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [propertyKey: propertyKey],
      call: {Jiramax.AppProperties, :addon_properties_resource_delete_app_property_delete},
      url: "/rest/forge/1/app/properties/#{propertyKey}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Jiramax.OperationMessage, :t}},
        {401, :null},
        {403, {:const, nil}},
        {404, {Jiramax.OperationMessage, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get app properties

  Gets all the properties of an app.

  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
  Additionally, Forge apps published on the Marketplace can access properties of Connect apps they were [migrated from](https://developer.atlassian.com/platform/forge/build-a-connect-on-forge-app/).
  """
  @spec addon_properties_resource_get_addon_properties_get(String.t(), keyword) ::
          {:ok, Jiramax.PropertyKeys.t()} | {:error, Jiramax.OperationMessage.t()}
  def addon_properties_resource_get_addon_properties_get(addonKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [addonKey: addonKey],
      call: {Jiramax.AppProperties, :addon_properties_resource_get_addon_properties_get},
      url: "/rest/atlassian-connect/1/addons/#{addonKey}/properties",
      method: :get,
      response: [{200, {Jiramax.PropertyKeys, :t}}, {401, {Jiramax.OperationMessage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get app property

  Returns the key and value of an app's property.

  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
  Additionally, Forge apps published on the Marketplace can access properties of Connect apps they were [migrated from](https://developer.atlassian.com/platform/forge/build-a-connect-on-forge-app/).
  """
  @spec addon_properties_resource_get_addon_property_get(String.t(), String.t(), keyword) ::
          {:ok, Jiramax.EntityProperty.t()} | {:error, Jiramax.OperationMessage.t()}
  def addon_properties_resource_get_addon_property_get(addonKey, propertyKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [addonKey: addonKey, propertyKey: propertyKey],
      call: {Jiramax.AppProperties, :addon_properties_resource_get_addon_property_get},
      url: "/rest/atlassian-connect/1/addons/#{addonKey}/properties/#{propertyKey}",
      method: :get,
      response: [
        {200, {Jiramax.EntityProperty, :t}},
        {400, {Jiramax.OperationMessage, :t}},
        {401, {Jiramax.OperationMessage, :t}},
        {404, {Jiramax.OperationMessage, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set app property

  Sets the value of an app's property. Use this resource to store custom data for your app.

  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request.
  """
  @spec addon_properties_resource_put_addon_property_put(String.t(), String.t(), map, keyword) ::
          {:ok, Jiramax.OperationMessage.t()} | {:error, Jiramax.OperationMessage.t()}
  def addon_properties_resource_put_addon_property_put(addonKey, propertyKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [addonKey: addonKey, propertyKey: propertyKey, body: body],
      call: {Jiramax.AppProperties, :addon_properties_resource_put_addon_property_put},
      url: "/rest/atlassian-connect/1/addons/#{addonKey}/properties/#{propertyKey}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {Jiramax.OperationMessage, :t}},
        {201, {Jiramax.OperationMessage, :t}},
        {400, {Jiramax.OperationMessage, :t}},
        {401, {Jiramax.OperationMessage, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set app property (Forge)

  Sets the value of a Forge app's property.
  These values can be retrieved in [Jira expressions](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/)
  through the `app` [context variable](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/#context-variables).

  For other use cases, use the [Storage API](https://developer.atlassian.com/platform/forge/runtime-reference/storage-api/).

  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

  **[Permissions](#permissions) required:** Only Forge apps can make this request.
  """
  @spec addon_properties_resource_put_app_property_put(String.t(), map, keyword) ::
          {:ok, Jiramax.OperationMessage.t()} | {:error, Jiramax.OperationMessage.t() | nil}
  def addon_properties_resource_put_app_property_put(propertyKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [propertyKey: propertyKey, body: body],
      call: {Jiramax.AppProperties, :addon_properties_resource_put_app_property_put},
      url: "/rest/forge/1/app/properties/#{propertyKey}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {Jiramax.OperationMessage, :t}},
        {201, {Jiramax.OperationMessage, :t}},
        {400, {Jiramax.OperationMessage, :t}},
        {401, :null},
        {403, {:const, nil}}
      ],
      opts: opts
    })
  end
end
