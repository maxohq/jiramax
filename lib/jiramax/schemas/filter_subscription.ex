defmodule Jiramax.FilterSubscription do
  @moduledoc """
  Provides struct and type for a FilterSubscription
  """

  @type t :: %__MODULE__{group: map | nil, id: integer | nil, user: map | nil}

  defstruct [:group, :id, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [group: :map, id: :integer, user: :map]
  end
end
