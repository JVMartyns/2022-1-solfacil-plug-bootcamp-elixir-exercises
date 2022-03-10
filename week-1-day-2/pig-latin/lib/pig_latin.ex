defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    #frase_list = String.split(String.trim(phrase))
    if Enum.at(phrase,  in "aeiou" do
      phrase <> 'ay'
    end
  end
end
