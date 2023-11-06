defmodule Jiramax.WorkflowCreateValidateRequest do
  @moduledoc """
  Provides struct and type for a WorkflowCreateValidateRequest
  """

  @type t :: %__MODULE__{
          payload: Jiramax.WorkflowCreateRequest.t(),
          validationOptions: Jiramax.ValidationOptionsForCreate.t() | nil
        }

  defstruct [:payload, :validationOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      payload: {Jiramax.WorkflowCreateRequest, :t},
      validationOptions: {Jiramax.ValidationOptionsForCreate, :t}
    ]
  end
end
