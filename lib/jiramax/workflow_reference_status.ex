defmodule Jiramax.WorkflowReferenceStatus do
  @moduledoc """
  Provides struct and type for a WorkflowReferenceStatus
  """

  @type t :: %__MODULE__{
          deprecated: boolean | nil,
          layout: Jiramax.WorkflowStatusLayout.t() | nil,
          properties: map | nil,
          statusReference: String.t() | nil
        }

  defstruct [:deprecated, :layout, :properties, :statusReference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      deprecated: :boolean,
      layout: {Jiramax.WorkflowStatusLayout, :t},
      properties: :map,
      statusReference: {:string, :generic}
    ]
  end
end
