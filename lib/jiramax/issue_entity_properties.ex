defmodule Jiramax.IssueEntityProperties do
  @moduledoc """
  Provides struct and type for a IssueEntityProperties
  """

  @type t :: %__MODULE__{entitiesIds: [integer] | nil, properties: map | nil}

  defstruct [:entitiesIds, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entitiesIds: [:integer], properties: :map]
  end
end
