defmodule Jiramax.Filter do
  @moduledoc """
  Provides struct and type for a Filter
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          editPermissions: [Jiramax.SharePermission.t()] | nil,
          favourite: boolean | nil,
          favouritedCount: integer | nil,
          id: String.t() | nil,
          jql: String.t() | nil,
          name: String.t(),
          owner: map | nil,
          searchUrl: String.t() | nil,
          self: String.t() | nil,
          sharePermissions: [Jiramax.SharePermission.t()] | nil,
          sharedUsers: map | nil,
          subscriptions: map | nil,
          viewUrl: String.t() | nil
        }

  defstruct [
    :description,
    :editPermissions,
    :favourite,
    :favouritedCount,
    :id,
    :jql,
    :name,
    :owner,
    :searchUrl,
    :self,
    :sharePermissions,
    :sharedUsers,
    :subscriptions,
    :viewUrl
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      editPermissions: [{Jiramax.SharePermission, :t}],
      favourite: :boolean,
      favouritedCount: :integer,
      id: {:string, :generic},
      jql: {:string, :generic},
      name: {:string, :generic},
      owner: :map,
      searchUrl: {:string, :uri},
      self: {:string, :uri},
      sharePermissions: [{Jiramax.SharePermission, :t}],
      sharedUsers: :map,
      subscriptions: :map,
      viewUrl: {:string, :uri}
    ]
  end
end
