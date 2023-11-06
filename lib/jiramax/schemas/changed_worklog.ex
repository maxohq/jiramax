defmodule Jiramax.ChangedWorklog do
  @moduledoc """
  Provides struct and type for a ChangedWorklog
  """

  @type t :: %__MODULE__{
          properties: [Jiramax.EntityProperty.t()] | nil,
          updatedTime: integer | nil,
          worklogId: integer | nil
        }

  defstruct [:properties, :updatedTime, :worklogId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [properties: [{Jiramax.EntityProperty, :t}], updatedTime: :integer, worklogId: :integer]
  end
end
