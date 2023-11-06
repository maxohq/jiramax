defmodule Jiramax.FilterSharing do
  @moduledoc """
  Provides API endpoints related to filter sharing
  """

  @default_client Jiramax.Client

  @doc """
  Add share permission

  Add a share permissions to a filter. If you add a global share permission (one for all logged-in users or the public) it will overwrite all share permissions for the filter.

  Be aware that this operation uses different objects for updating share permissions compared to [Update filter](#api-rest-api-3-filter-id-put).

  **[Permissions](#permissions) required:** *Share dashboards and filters* [global permission](https://confluence.atlassian.com/x/x4dKLg) and the user must own the filter.
  """
  @spec add_share_permission(integer, Jiramax.SharePermissionInputBean.t(), keyword) ::
          {:ok, [Jiramax.SharePermission.t()]} | :error
  def add_share_permission(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Jiramax.FilterSharing, :add_share_permission},
      url: "/rest/api/3/filter/#{id}/permission",
      body: body,
      method: :post,
      request: [{"application/json", {Jiramax.SharePermissionInputBean, :t}}],
      response: [{201, [{Jiramax.SharePermission, :t}]}, {400, :null}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Delete share permission

  Deletes a share permission from a filter.

  **[Permissions](#permissions) required:** Permission to access Jira and the user must own the filter.
  """
  @spec delete_share_permission(integer, integer, keyword) :: :ok | :error
  def delete_share_permission(id, permissionId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, permissionId: permissionId],
      call: {Jiramax.FilterSharing, :delete_share_permission},
      url: "/rest/api/3/filter/#{id}/permission/#{permissionId}",
      method: :delete,
      response: [{204, :null}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get default share scope

  Returns the default sharing settings for new filters and dashboards for a user.

  **[Permissions](#permissions) required:** Permission to access Jira.
  """
  @spec get_default_share_scope(keyword) :: {:ok, Jiramax.DefaultShareScope.t()} | :error
  def get_default_share_scope(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Jiramax.FilterSharing, :get_default_share_scope},
      url: "/rest/api/3/filter/defaultShareScope",
      method: :get,
      response: [{200, {Jiramax.DefaultShareScope, :t}}, {401, :null}],
      opts: opts
    })
  end

  @doc """
  Get share permission

  Returns a share permission for a filter. A filter can be shared with groups, projects, all logged-in users, or the public. Sharing with all logged-in users or the public is known as a global share permission.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None, however, a share permission is only returned for:

   *  filters owned by the user.
   *  filters shared with a group that the user is a member of.
   *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
   *  filters shared with a public project.
   *  filters shared with the public.
  """
  @spec get_share_permission(integer, integer, keyword) ::
          {:ok, Jiramax.SharePermission.t()} | :error
  def get_share_permission(id, permissionId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, permissionId: permissionId],
      call: {Jiramax.FilterSharing, :get_share_permission},
      url: "/rest/api/3/filter/#{id}/permission/#{permissionId}",
      method: :get,
      response: [{200, {Jiramax.SharePermission, :t}}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Get share permissions

  Returns the share permissions for a filter. A filter can be shared with groups, projects, all logged-in users, or the public. Sharing with all logged-in users or the public is known as a global share permission.

  This operation can be accessed anonymously.

  **[Permissions](#permissions) required:** None, however, share permissions are only returned for:

   *  filters owned by the user.
   *  filters shared with a group that the user is a member of.
   *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
   *  filters shared with a public project.
   *  filters shared with the public.
  """
  @spec get_share_permissions(integer, keyword) :: {:ok, [Jiramax.SharePermission.t()]} | :error
  def get_share_permissions(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Jiramax.FilterSharing, :get_share_permissions},
      url: "/rest/api/3/filter/#{id}/permission",
      method: :get,
      response: [{200, [{Jiramax.SharePermission, :t}]}, {401, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Set default share scope

  Sets the default sharing for new filters and dashboards for a user.

  **[Permissions](#permissions) required:** Permission to access Jira.
  """
  @spec set_default_share_scope(Jiramax.DefaultShareScope.t(), keyword) ::
          {:ok, Jiramax.DefaultShareScope.t()} | :error
  def set_default_share_scope(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.FilterSharing, :set_default_share_scope},
      url: "/rest/api/3/filter/defaultShareScope",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.DefaultShareScope, :t}}],
      response: [{200, {Jiramax.DefaultShareScope, :t}}, {400, :null}, {401, :null}],
      opts: opts
    })
  end
end
