defmodule Jiramax.Dashboard do
  @moduledoc """
  Provides struct and type for a Dashboard
  """

  @type t :: %__MODULE__{
          automaticRefreshMs: integer | nil,
          description: String.t() | nil,
          editPermissions: [Jiramax.SharePermission.t()] | nil,
          id: String.t() | nil,
          isFavourite: boolean | nil,
          isWritable: boolean | nil,
          name: String.t() | nil,
          owner: map | nil,
          popularity: integer | nil,
          rank: integer | nil,
          self: String.t() | nil,
          sharePermissions: [Jiramax.SharePermission.t()] | nil,
          systemDashboard: boolean | nil,
          view: String.t() | nil
        }

  defstruct [
    :automaticRefreshMs,
    :description,
    :editPermissions,
    :id,
    :isFavourite,
    :isWritable,
    :name,
    :owner,
    :popularity,
    :rank,
    :self,
    :sharePermissions,
    :systemDashboard,
    :view
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      automaticRefreshMs: :integer,
      description: {:string, :generic},
      editPermissions: [{Jiramax.SharePermission, :t}],
      id: {:string, :generic},
      isFavourite: :boolean,
      isWritable: :boolean,
      name: {:string, :generic},
      owner: :map,
      popularity: :integer,
      rank: :integer,
      self: {:string, :uri},
      sharePermissions: [{Jiramax.SharePermission, :t}],
      systemDashboard: :boolean,
      view: {:string, :generic}
    ]
  end
end
