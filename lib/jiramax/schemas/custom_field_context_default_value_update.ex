defmodule Jiramax.CustomFieldContextDefaultValueUpdate do
  @moduledoc """
  Provides struct and type for a CustomFieldContextDefaultValueUpdate
  """

  @type t :: %__MODULE__{
          defaultValues:
            [
              Jiramax.CustomFieldContextDefaultValueCascadingOption.t()
              | Jiramax.CustomFieldContextDefaultValueDate.t()
              | Jiramax.CustomFieldContextDefaultValueDateTime.t()
              | Jiramax.CustomFieldContextDefaultValueFloat.t()
              | Jiramax.CustomFieldContextDefaultValueForgeDateTimeField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeGroupField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeMultiGroupField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeMultiStringField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeMultiUserField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeNumberField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeObjectField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeStringField.t()
              | Jiramax.CustomFieldContextDefaultValueForgeUserField.t()
              | Jiramax.CustomFieldContextDefaultValueLabels.t()
              | Jiramax.CustomFieldContextDefaultValueMultiUserPicker.t()
              | Jiramax.CustomFieldContextDefaultValueMultipleGroupPicker.t()
              | Jiramax.CustomFieldContextDefaultValueMultipleOption.t()
              | Jiramax.CustomFieldContextDefaultValueMultipleVersionPicker.t()
              | Jiramax.CustomFieldContextDefaultValueProject.t()
              | Jiramax.CustomFieldContextDefaultValueReadOnly.t()
              | Jiramax.CustomFieldContextDefaultValueSingleGroupPicker.t()
              | Jiramax.CustomFieldContextDefaultValueSingleOption.t()
              | Jiramax.CustomFieldContextDefaultValueSingleVersionPicker.t()
              | Jiramax.CustomFieldContextDefaultValueTextArea.t()
              | Jiramax.CustomFieldContextDefaultValueTextField.t()
              | Jiramax.CustomFieldContextDefaultValueUrl.t()
              | Jiramax.CustomFieldContextSingleUserPickerDefaults.t()
            ]
            | nil
        }

  defstruct [:defaultValues]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      defaultValues: [
        union: [
          {Jiramax.CustomFieldContextDefaultValueCascadingOption, :t},
          {Jiramax.CustomFieldContextDefaultValueDate, :t},
          {Jiramax.CustomFieldContextDefaultValueDateTime, :t},
          {Jiramax.CustomFieldContextDefaultValueFloat, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeDateTimeField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeGroupField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeMultiGroupField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeMultiStringField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeMultiUserField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeNumberField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeObjectField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeStringField, :t},
          {Jiramax.CustomFieldContextDefaultValueForgeUserField, :t},
          {Jiramax.CustomFieldContextDefaultValueLabels, :t},
          {Jiramax.CustomFieldContextDefaultValueMultiUserPicker, :t},
          {Jiramax.CustomFieldContextDefaultValueMultipleGroupPicker, :t},
          {Jiramax.CustomFieldContextDefaultValueMultipleOption, :t},
          {Jiramax.CustomFieldContextDefaultValueMultipleVersionPicker, :t},
          {Jiramax.CustomFieldContextDefaultValueProject, :t},
          {Jiramax.CustomFieldContextDefaultValueReadOnly, :t},
          {Jiramax.CustomFieldContextDefaultValueSingleGroupPicker, :t},
          {Jiramax.CustomFieldContextDefaultValueSingleOption, :t},
          {Jiramax.CustomFieldContextDefaultValueSingleVersionPicker, :t},
          {Jiramax.CustomFieldContextDefaultValueTextArea, :t},
          {Jiramax.CustomFieldContextDefaultValueTextField, :t},
          {Jiramax.CustomFieldContextDefaultValueUrl, :t},
          {Jiramax.CustomFieldContextSingleUserPickerDefaults, :t}
        ]
      ]
    ]
  end
end
