defprotocol Chexes do
  @fallback_to_any true

  def blank?(data)
  def present?(data)
end

defimpl Chexes, for: Integer do
  alias Chexes
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: String do
  alias Chexes
  def blank?(''),     do: true
  def blank?(' '),    do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: BitString do
  alias Chexes
  def blank?(""),     do: true
  def blank?(" "),    do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: List do
  alias Chexes
  def blank?([]),     do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: Tuple do
  alias Chexes
  def blank?({}),     do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: Map do
  alias Chexes
  def blank?(map) when map_size(map) > 0, do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: Atom do
  alias Chexes
  def blank?(false),  do: true
  def blank?(nil),    do: true
  def blank?(_),      do: false
  def present?(data), do: not Chexes.blank?(data)
end

defimpl Chexes, for: MapSet do
  alias Chexes
  def blank?(data),   do: Enum.empty?(data)
  def present?(data), do: not Chexes.blank?(data)
end

if Code.ensure_loaded?(Ecto) do
  defimpl Chexes, for: Ecto.Date do
    alias Chexes
    def blank?(%Ecto.Date{year: 0, month: 0, day: 0}), do: true
    def blank?(%Ecto.Date{year: 1, month: 1, day: 1}), do: true
    def blank?(_), do: false
    def present?(data), do: not Chexes.blank?(data)
  end

  defimpl Chexes, for: Ecto.Association.NotLoaded do
    alias Chexes

    def blank?(_), do: true
    def present?(data), do: not Chexes.blank?(data)
  end
end

defimpl Chexes, for: Any do
  def blank?(_),      do: false
  def present?(_),    do: false
end
