defmodule SurfaceBulma.Form.RadioButton do
  @moduledoc """
  The radio button component as defined in https://bulma.io/documentation/form/radio/
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, RadioButton}

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Any opts you want to pass on to internal `Surface.RadioButton` and `Phoenix.HTML.Form.radio_button/3`"
  prop opts, :keyword, default: []

  @doc "Class to apply to input"
  prop class, :css_class, default: []

  @doc """
  `options` are expected to be an enumerable which will be used to
  generate each respective `RadioButton`. The enumerable may have:
    * keyword lists - each keyword list is expected to have the keys
      `:key` and `:value`. Additional keys such as `:disabled` may
      be given to customize the option
    * two-item tuples - where the first element is an atom, string or
      integer to be used as the option label and the second element is
      an atom, string or integer to be used as the option value
    * atom, string or integer - which will be used as both label and value
      for the generated select
  """
  prop options, :list

  slot default

  def render(assigns) do
    ~H"""
      <Field class="field" name={{@field}}>
      <div class="control">
        <For each={{ entry <- @options}}>
          <label class="radio">
            <RadioButton
              field={{@field}}
              opts={{ [disabled: get_disabled(entry)] ++ @opts  }}
              class={{@class}}
              value={{get_key(entry)}}

              />
            {{get_value(entry)}}
          </label>
        </For>
      </div>
      </Field>
    """
  end

  defp get_key({key, _value}), do: key

  defp get_key(list) when is_list(list), do: Keyword.get(list, :key)

  defp get_key(key), do: key

  defp get_disabled(list) when is_list(list), do: Keyword.get(list, :disabled, false)
  defp get_disabled(_), do: false

  defp get_value({_key, value}), do: value
  defp get_value(list) when is_list(list), do: Keyword.get(list, :value)
  defp get_value(value), do: value
end
