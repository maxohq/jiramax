defmodule Jiramax.CreateWorkflowDetails do
  @moduledoc """
  Provides struct and type for a CreateWorkflowDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          statuses: [Jiramax.CreateWorkflowStatusDetails.t()],
          transitions: [Jiramax.CreateWorkflowTransitionDetails.t()]
        }

  defstruct [:description, :name, :statuses, :transitions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      statuses: [{Jiramax.CreateWorkflowStatusDetails, :t}],
      transitions: [{Jiramax.CreateWorkflowTransitionDetails, :t}]
    ]
  end
end
