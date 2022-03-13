defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    vowels = String.split("a,e,i,o,u", ",")
    consonants = String.split("b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z", ",")
    list_of_words = String.split(String.trim(phrase))

    Enum.map(list_of_words, fn word ->
      cond do
        # "word beginning with [a,e,i,o,u]" or
        # "word beginning with q without a following u" or
        # "word beginning with "y" and following a consonant or
        # "word beginning with [xr, xb]"
        String.at(word, 0) in vowels or
          (String.at(word, 0) in vowels and String.slice(word, 1..2) == "qu") or
          (String.at(word, 0) == "y" and String.at(word, 1) in consonants) or
            String.slice(word, 0..1) in ["xr", "xb"] ->
          word <> "ay"

        # "word beginning with sch or thr" or
        # "word beginning with qu and a preceding consonant"
        String.slice(word, 0..2) in ["sch", "thr"] or
            (String.at(word, 0) in consonants and String.slice(word, 1..2) == "qu") ->
          String.slice(word, 3..-1) <> String.slice(word, 0..2) <> "ay"

        # word beginning with th or qu or ch
        String.slice(word, 0..1) in ["th", "qu", "ch"] ->
          String.slice(word, 2..-1) <> String.slice(word, 0..1) <> "ay"

        # "y is treated like a consonant at the beginning of a word"
        # "y as second letter in two letter word"
        # "word beginning with one consoant"
        (String.length(word) == 2 and String.at(word, 1) == "y") or
            String.at(word, 0) == "y" ->
          String.slice(word, 1..-1) <> String.at(word, 0) <> "ay"

        # Must pass the following test
        # "y is treated like a vowel at the end of a consonant cluster"

        # "word beginning with two consonants"
        # "word beginning with three consonants"
        # "word beginning with a series of consonants : aliens speak Pig Latin too"
        String.at(word, 0) in consonants ->
          String.slice(word, teste(word, vowels)..-1) <>
            String.slice(word, 0..(teste(word, vowels) - 1)) <> "ay"
      end
    end)
    |> Enum.join(" ")
  end

  def teste(word, vowels) do
    vogais = palavra = String.split(word, "", trim: true)

    Enum.reduce_while(palavra, 0, fn letra, acc ->
      if letra in vowels do
        {:halt, acc}
      else
        {:cont, acc + 1}
      end
    end)
  end
end
