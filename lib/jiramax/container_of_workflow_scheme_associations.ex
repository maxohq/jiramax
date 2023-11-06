defmodule Jiramax.ContainerOfWorkflowSchemeAssociations do
  @moduledoc """
  Provides struct and type for a ContainerOfWorkflowSchemeAssociations
  """

  @type t :: %__MODULE__{values: [Jiramax.WorkflowSchemeAssociations.t()]}

  defstruct [:values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [values: [{Jiramax.WorkflowSchemeAssociations, :t}]]
  end
end
