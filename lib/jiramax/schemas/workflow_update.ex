defmodule Jiramax.WorkflowUpdate do
  @moduledoc """
  Provides struct and type for a WorkflowUpdate
  """

  @type t :: %__MODULE__{
          defaultStatusMappings: [Jiramax.StatusMigration.t()] | nil,
          description: String.t() | nil,
          id: String.t(),
          startPointLayout: Jiramax.WorkflowLayout.t() | nil,
          statusMappings: [Jiramax.StatusMappingDto.t()] | nil,
          statuses: [Jiramax.StatusLayoutUpdate.t()],
          transitions: [Jiramax.TransitionUpdateDto.t()],
          version: Jiramax.DocumentVersion.t()
        }

  defstruct [
    :defaultStatusMappings,
    :description,
    :id,
    :startPointLayout,
    :statusMappings,
    :statuses,
    :transitions,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      defaultStatusMappings: [{Jiramax.StatusMigration, :t}],
      description: {:string, :generic},
      id: {:string, :generic},
      startPointLayout: {Jiramax.WorkflowLayout, :t},
      statusMappings: [{Jiramax.StatusMappingDto, :t}],
      statuses: [{Jiramax.StatusLayoutUpdate, :t}],
      transitions: [{Jiramax.TransitionUpdateDto, :t}],
      version: {Jiramax.DocumentVersion, :t}
    ]
  end
end
