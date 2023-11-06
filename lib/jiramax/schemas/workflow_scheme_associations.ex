defmodule Jiramax.WorkflowSchemeAssociations do
  @moduledoc """
  Provides struct and type for a WorkflowSchemeAssociations
  """

  @type t :: %__MODULE__{projectIds: [String.t()], workflowScheme: map}

  defstruct [:projectIds, :workflowScheme]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [projectIds: [string: :generic], workflowScheme: :map]
  end
end
