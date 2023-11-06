defmodule Jiramax.DeleteAndReplaceVersionBean do
  @moduledoc """
  Provides struct and type for a DeleteAndReplaceVersionBean
  """

  @type t :: %__MODULE__{
          customFieldReplacementList: [Jiramax.CustomFieldReplacement.t()] | nil,
          moveAffectedIssuesTo: integer | nil,
          moveFixIssuesTo: integer | nil
        }

  defstruct [:customFieldReplacementList, :moveAffectedIssuesTo, :moveFixIssuesTo]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customFieldReplacementList: [{Jiramax.CustomFieldReplacement, :t}],
      moveAffectedIssuesTo: :integer,
      moveFixIssuesTo: :integer
    ]
  end
end
