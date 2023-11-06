defmodule Jiramax.SecuritySchemeMembersRequest do
  @moduledoc """
  Provides struct and type for a SecuritySchemeMembersRequest
  """

  @type t :: %__MODULE__{members: [Jiramax.SecuritySchemeLevelMemberBean.t()] | nil}

  defstruct [:members]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [members: [{Jiramax.SecuritySchemeLevelMemberBean, :t}]]
  end
end
