defmodule Jiramax.UiModificationContextDetails do
  @moduledoc """
  Provides struct and type for a UiModificationContextDetails
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          isAvailable: boolean | nil,
          issueTypeId: String.t(),
          projectId: String.t(),
          viewType: String.t()
        }

  defstruct [:id, :isAvailable, :issueTypeId, :projectId, :viewType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      isAvailable: :boolean,
      issueTypeId: {:string, :generic},
      projectId: {:string, :generic},
      viewType: {:enum, ["GIC", "IssueView"]}
    ]
  end
end
