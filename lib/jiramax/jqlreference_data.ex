defmodule Jiramax.JqlreferenceData do
  @moduledoc """
  Provides struct and type for a JqlreferenceData
  """

  @type t :: %__MODULE__{
          jqlReservedWords: [String.t()] | nil,
          visibleFieldNames: [Jiramax.FieldReferenceData.t()] | nil,
          visibleFunctionNames: [Jiramax.FunctionReferenceData.t()] | nil
        }

  defstruct [:jqlReservedWords, :visibleFieldNames, :visibleFunctionNames]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      jqlReservedWords: [string: :generic],
      visibleFieldNames: [{Jiramax.FieldReferenceData, :t}],
      visibleFunctionNames: [{Jiramax.FunctionReferenceData, :t}]
    ]
  end
end
