defmodule Jiramax.ProjectComponent do
  @moduledoc """
  Provides struct and type for a ProjectComponent
  """

  @type t :: %__MODULE__{
          ari: String.t() | nil,
          assignee: map | nil,
          assigneeType: String.t() | nil,
          description: String.t() | nil,
          id: String.t() | nil,
          isAssigneeTypeValid: boolean | nil,
          lead: map | nil,
          leadAccountId: String.t() | nil,
          leadUserName: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          project: String.t() | nil,
          projectId: integer | nil,
          realAssignee: map | nil,
          realAssigneeType: String.t() | nil,
          self: String.t() | nil
        }

  defstruct [
    :ari,
    :assignee,
    :assigneeType,
    :description,
    :id,
    :isAssigneeTypeValid,
    :lead,
    :leadAccountId,
    :leadUserName,
    :metadata,
    :name,
    :project,
    :projectId,
    :realAssignee,
    :realAssigneeType,
    :self
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ari: {:string, :generic},
      assignee: :map,
      assigneeType: {:enum, ["PROJECT_DEFAULT", "COMPONENT_LEAD", "PROJECT_LEAD", "UNASSIGNED"]},
      description: {:string, :generic},
      id: {:string, :generic},
      isAssigneeTypeValid: :boolean,
      lead: :map,
      leadAccountId: {:string, :generic},
      leadUserName: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      project: {:string, :generic},
      projectId: :integer,
      realAssignee: :map,
      realAssigneeType:
        {:enum, ["PROJECT_DEFAULT", "COMPONENT_LEAD", "PROJECT_LEAD", "UNASSIGNED"]},
      self: {:string, :uri}
    ]
  end
end
