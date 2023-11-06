defmodule Jiramax.WorkflowCreate do
  @moduledoc """
  Provides struct and type for a WorkflowCreate
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          startPointLayout: Jiramax.WorkflowLayout.t() | nil,
          statuses: [Jiramax.StatusLayoutUpdate.t()],
          transitions: [Jiramax.TransitionUpdateDto.t()]
        }

  defstruct [:description, :name, :startPointLayout, :statuses, :transitions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      startPointLayout: {Jiramax.WorkflowLayout, :t},
      statuses: [{Jiramax.StatusLayoutUpdate, :t}],
      transitions: [{Jiramax.TransitionUpdateDto, :t}]
    ]
  end
end
