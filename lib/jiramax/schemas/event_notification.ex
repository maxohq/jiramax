defmodule Jiramax.EventNotification do
  @moduledoc """
  Provides struct and type for a EventNotification
  """

  @type t :: %__MODULE__{
          emailAddress: String.t() | nil,
          expand: String.t() | nil,
          field: map | nil,
          group: map | nil,
          id: integer | nil,
          notificationType: String.t() | nil,
          parameter: String.t() | nil,
          projectRole: map | nil,
          recipient: String.t() | nil,
          user: map | nil
        }

  defstruct [
    :emailAddress,
    :expand,
    :field,
    :group,
    :id,
    :notificationType,
    :parameter,
    :projectRole,
    :recipient,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      emailAddress: {:string, :generic},
      expand: {:string, :generic},
      field: :map,
      group: :map,
      id: :integer,
      notificationType:
        {:enum,
         [
           "CurrentAssignee",
           "Reporter",
           "CurrentUser",
           "ProjectLead",
           "ComponentLead",
           "User",
           "Group",
           "ProjectRole",
           "EmailAddress",
           "AllWatchers",
           "UserCustomField",
           "GroupCustomField"
         ]},
      parameter: {:string, :generic},
      projectRole: :map,
      recipient: {:string, :generic},
      user: :map
    ]
  end
end
