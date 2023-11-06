defmodule Jiramax.DashboardDetails do
  @moduledoc """
  Provides struct and type for a DashboardDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          editPermissions: [Jiramax.SharePermission.t()],
          name: String.t(),
          sharePermissions: [Jiramax.SharePermission.t()]
        }

  defstruct [:description, :editPermissions, :name, :sharePermissions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      editPermissions: [{Jiramax.SharePermission, :t}],
      name: {:string, :generic},
      sharePermissions: [{Jiramax.SharePermission, :t}]
    ]
  end
end
