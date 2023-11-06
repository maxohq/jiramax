defmodule Jiramax.PermittedProjects do
  @moduledoc """
  Provides struct and type for a PermittedProjects
  """

  @type t :: %__MODULE__{projects: [Jiramax.ProjectIdentifierBean.t()] | nil}

  defstruct [:projects]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [projects: [{Jiramax.ProjectIdentifierBean, :t}]]
  end
end
