defmodule Jiramax.WorkflowUpdateRequest do
  @moduledoc """
  Provides struct and type for a WorkflowUpdateRequest
  """

  @type t :: %__MODULE__{
          statuses: [Jiramax.WorkflowStatusUpdate.t()],
          workflows: [Jiramax.WorkflowUpdate.t()]
        }

  defstruct [:statuses, :workflows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [statuses: [{Jiramax.WorkflowStatusUpdate, :t}], workflows: [{Jiramax.WorkflowUpdate, :t}]]
  end
end
