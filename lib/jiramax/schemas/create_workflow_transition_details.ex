defmodule Jiramax.CreateWorkflowTransitionDetails do
  @moduledoc """
  Provides struct and type for a CreateWorkflowTransitionDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          from: [String.t()] | nil,
          name: String.t(),
          properties: map | nil,
          rules: map | nil,
          screen: map | nil,
          to: String.t(),
          type: String.t()
        }

  defstruct [:description, :from, :name, :properties, :rules, :screen, :to, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      from: [string: :generic],
      name: {:string, :generic},
      properties: :map,
      rules: :map,
      screen: :map,
      to: {:string, :generic},
      type: {:enum, ["global", "initial", "directed"]}
    ]
  end
end
