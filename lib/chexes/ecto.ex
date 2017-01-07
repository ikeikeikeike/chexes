defmodule Chexes.Ecto do
  defmacro __using__(_) do
    quote do
      defimpl Chexes, for: __MODULE__ do
        def present?(%{id: id}) do
          Chexes.present?(id)
        end
        def present?(_) do
          false
        end
        def blank?(data) do
          not Chexes.present?(data)
        end
      end
    end
  end
end
