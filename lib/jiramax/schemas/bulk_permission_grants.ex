defmodule Jiramax.BulkPermissionGrants do
  @moduledoc """
  Provides struct and type for a BulkPermissionGrants
  """

  @type t :: %__MODULE__{
          globalPermissions: [String.t()],
          projectPermissions: [Jiramax.BulkProjectPermissionGrants.t()]
        }

  defstruct [:globalPermissions, :projectPermissions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      globalPermissions: [string: :generic],
      projectPermissions: [{Jiramax.BulkProjectPermissionGrants, :t}]
    ]
  end
end
