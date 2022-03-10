defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    vowels = "aeiou"
    consonants = "bcdfghjklmnpqrstvwxyz"
    list_phrase = String.split(String.trim(phrase))

    Enum.map(list_phrase, fn word ->
      cond do
        # word beginning with [a,e,i,o,u] or beginning with "y" and following a consonant
        String.at(word, 0) in String.split(vowels, "") or
            (String.at(word, 0) == "y" and String.at(word, 1) in String.split(consonants, "")) ->
          word <> "ay"

        # word beginning with sch or thr
        String.slice(word, 0..2) == "sch" or
            String.slice(word, 0..2) == "thr" ->
          String.slice(word, 3..-1) <> String.slice(word, 0..2) <> "ay"

        # word beginning with th or qu or ch
        String.slice(word, 0..1) == "th" or
          String.slice(word, 0..1) == "qu" or
            String.slice(word, 0..1) == "ch" ->
          String.slice(word, 2..-1) <> String.slice(word, 0..1) <> "ay"

        String.at(word, 0) in String.split(consonants, "") and String.slice(word, 1..2) == "qu" ->
          String.slice(word, 3..-1) <> String.slice(word, 0..2) <> "ay"

        # word beginning with three consonants
        String.at(word, 0) in String.split(consonants, "") and
          String.at(word, 1) in String.split(consonants, "") and
            String.at(word, 2) in String.split(consonants, "") ->
          String.slice(word, 3..-1) <> String.slice(word, 0..2) <> "ay"

        # word beginning with two consonants
        String.at(word, 0) in String.split(consonants, "") and
            String.at(word, 1) in String.split(consonants, "") ->
          String.slice(word, 2..-1) <> String.slice(word, 0..1) <> "ay"

        String.at(word, 0) in String.split(consonants, "") ->
          String.slice(word, 1..-1) <> String.slice(word, 0..0) <> "ay"
      end
    end)
    |> Enum.join(" ")
  end
end
