module songstrings

export songnames, instruments, folder, filenames

#=
songnames = split(
    "A Classic Education - NightOwl,Actions - One Minute Smile,Angela Thomas Wade - Milk Cow Blues,Atlantis Bound - It Was My Fault For Waiting,Creepoid - OldTree,Dreamers Of The Ghetto - Heavy Love,Fergessen - The Wind,Grants - PunchDrunk,Hezekiah Jones - Borrowed Heart,James May - All Souls Moon,James May - On The Line,Jokers, Jacks & Kings - Sea Of Leaves,Leaf - Come Around,Leaf - Wicked,Meaxic - Take A Step,Music Delta - Gospel,Music Delta - Punk,Night Panther - Fire,Patrick Talbot - Set Me Free,Port St Willow - Stay Even,Remember December - C U Next Time,Secret Mountains - High Horse,Skelpolu - Together Alone,The Districts - Vermont,Traffic Experiment - Once More (With Feeling),Young Griffo - Facade,Young Griffo - Pennies"
, ",")=#
songnames = ["A Classic Education - NightOwl", "Actions - One Minute Smile", "Angela Thomas Wade - Milk Cow Blues", "Atlantis Bound - It Was My Fault For Waiting", "Creepoid - OldTree", "Dreamers Of The Ghetto - Heavy Love", "Fergessen - The Wind", "Grants - PunchDrunk", "Hezekiah Jones - Borrowed Heart", "James May - All Souls Moon", "James May - On The Line", "Jokers, Jacks & Kings - Sea Of Leaves", "Leaf - Come Around", "Leaf - Wicked", "Meaxic - Take A Step", "Music Delta - Gospel", "Music Delta - Punk", "Night Panther - Fire", "Patrick Talbot - Set Me Free", "Port St Willow - Stay Even", "Remember December - C U Next Time", "Secret Mountains - High Horse", "Skelpolu - Together Alone", "The Districts - Vermont", "Traffic Experiment - Once More (With Feeling)", "Young Griffo - Facade", "Young Griffo - Pennies"]

instruments = [
    "bass",
    "drums",
    "mixture",
    "other",
    "vocals"
]

folder = "..\\stems\\"

# filenames =
# Dict(("bass", ["..\stems\A Classic Education - NightOwl\bass.wav", ...]), ...) 

filenames = Dict(
    (instruments[i],
     [folder * songnames[j] *"\\"* instruments[i] * ".wav" for j ∈ eachindex(songnames)]
     ) for i ∈ eachindex(instruments)
)

end # songsstrings