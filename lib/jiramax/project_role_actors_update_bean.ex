defmodule Jiramax.ProjectRoleActorsUpdateBean do
  @moduledoc """
  Provides struct and type for a ProjectRoleActorsUpdateBean
  """

  @type t :: %__MODULE__{categorisedActors: map | nil, id: integer | nil}

  defstruct [:categorisedActors, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categorisedActors: :map, id: :integer]
  end
end
