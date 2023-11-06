defmodule Jiramax.AssociateFieldConfigurationsWithIssueTypesRequest do
  @moduledoc """
  Provides struct and type for a AssociateFieldConfigurationsWithIssueTypesRequest
  """

  @type t :: %__MODULE__{mappings: [Jiramax.FieldConfigurationToIssueTypeMapping.t()]}

  defstruct [:mappings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mappings: [{Jiramax.FieldConfigurationToIssueTypeMapping, :t}]]
  end
end
