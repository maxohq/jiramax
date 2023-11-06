defmodule Jiramax.PermissionGrant do
  @moduledoc """
  Provides struct and type for a PermissionGrant
  """

  @type t :: %__MODULE__{
          holder: map | nil,
          id: integer | nil,
          permission: String.t() | nil,
          self: String.t() | nil
        }

  defstruct [:holder, :id, :permission, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [holder: :map, id: :integer, permission: {:string, :generic}, self: {:string, :uri}]
  end
end
