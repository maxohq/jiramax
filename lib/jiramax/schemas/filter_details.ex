defmodule Jiramax.FilterDetails do
  @moduledoc """
  Provides struct and type for a FilterDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          editPermissions: [Jiramax.SharePermission.t()] | nil,
          expand: String.t() | nil,
          favourite: boolean | nil,
          favouritedCount: integer | nil,
          id: String.t() | nil,
          jql: String.t() | nil,
          name: String.t(),
          owner: map | nil,
          searchUrl: String.t() | nil,
          self: String.t() | nil,
          sharePermissions: [Jiramax.SharePermission.t()] | nil,
          subscriptions: [Jiramax.FilterSubscription.t()] | nil,
          viewUrl: String.t() | nil
        }

  defstruct [
    :description,
    :editPermissions,
    :expand,
    :favourite,
    :favouritedCount,
    :id,
    :jql,
    :name,
    :owner,
    :searchUrl,
    :self,
    :sharePermissions,
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
      expand: {:string, :generic},
      favourite: :boolean,
      favouritedCount: :integer,
      id: {:string, :generic},
      jql: {:string, :generic},
      name: {:string, :generic},
      owner: :map,
      searchUrl: {:string, :uri},
      self: {:string, :uri},
      sharePermissions: [{Jiramax.SharePermission, :t}],
      subscriptions: [{Jiramax.FilterSubscription, :t}],
      viewUrl: {:string, :uri}
    ]
  end
end
