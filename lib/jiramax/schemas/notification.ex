defmodule Jiramax.Notification do
  @moduledoc """
  Provides struct and type for a Notification
  """

  @type t :: %__MODULE__{
          htmlBody: String.t() | nil,
          restrict: map | nil,
          subject: String.t() | nil,
          textBody: String.t() | nil,
          to: map | nil
        }

  defstruct [:htmlBody, :restrict, :subject, :textBody, :to]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      htmlBody: {:string, :generic},
      restrict: :map,
      subject: {:string, :generic},
      textBody: {:string, :generic},
      to: :map
    ]
  end
end
