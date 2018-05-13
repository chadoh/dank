# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dank.Repo.insert!(%Dank.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Create 10 dispensaries in this part

alias Dank.Dispensary

[
  %Dispensary{ name: "Nice Nugs", location: "24 E King Street", description: "Find all the best nugs here" },
  %Dispensary{ name: "Best Buds", location: "52 N Lime Street", description: "If you need a bud, we got u" },
]
|> Enum.each(fn dispensary ->
  Dank.Repo.get_by(Dispensary, name: dispensary.name) ||
    Dank.Repo.insert!(dispensary)
end)
