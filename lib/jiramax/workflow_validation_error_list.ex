defmodule Jiramax.WorkflowValidationErrorList do
  @moduledoc """
  Provides struct and type for a WorkflowValidationErrorList
  """

  @type t :: %__MODULE__{errors: [Jiramax.WorkflowValidationError.t()] | nil}

  defstruct [:errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{Jiramax.WorkflowValidationError, :t}]]
  end
end
