defmodule Jiramax.IssueUpdateDetails do
  @moduledoc """
  Provides struct and type for a IssueUpdateDetails
  """

  @type t :: %__MODULE__{
          fields: map | nil,
          historyMetadata: map | nil,
          properties: [Jiramax.EntityProperty.t()] | nil,
          transition: map | nil,
          update: map | nil
        }

  defstruct [:fields, :historyMetadata, :properties, :transition, :update]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fields: :map,
      historyMetadata: :map,
      properties: [{Jiramax.EntityProperty, :t}],
      transition: :map,
      update: :map
    ]
  end
end
