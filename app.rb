# app.rb
require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'tempfile'
require 'line/bot'
require_relative 'debug'
require 'ostruct'

def client
  @client ||= Line::Bot::Client.new do |config|
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_ACCESS_TOKEN']
  end
end



def bot_answer_to(table, roll)
  log("Bot function started.")

  all_stars = [
    {name: "Akhorne The Squirrel",
    cost: 80,
    rules: ['Any']
    },
    {name: "Anqi Panqi",
    cost: 190,
    rules: ["Lustrian Superleague"]
    },
    {name: "Barik Farblast",
    cost: 80,
    rules: ['Old World Classic', 'Worlds Edge Superleague']
    },
    {name: "Bilerot Vomitflesh (Favoured of Nurgle)",
    cost: 180,
    rules: ['Chaos Clash']
    },
    {name: "The Black Gobbo",
    cost: 210,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    {name: "Boa Kon\'ssstriktr",
    cost: 180,
    rules: ['Lustrian Superleague']
    },
    {name: "Bomber Dribblesnot",
    cost: 80,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    # {name: "Bryce \'The Slice\' Cambuel",
    # cost: 130,
    # rules: ['Sylvanian Spotlight']
    # },
    {name: "\'Captain\' Karina Von Riesz",
    cost: 230,
    rules: ['Sylvanian Spotlight']
    },
    {name: "Count Luthor von Drakenborg",
    cost: 300,
    rules: ['Sylvanian Spotlight']
    },
    {name: "Cindy Piewhistle",
    cost: 100,
    rules: ['Halfling Thimble Cup', 'Old World Classic']
    },
    {name: "Deeproot Strongbranch",
    cost: 280,
    rules: ['Woodland League']
    },
    {name: "Dribl and Drull",
    cost: 230,
    rules: ['Lustrian Superleague']
    },
    {name: "Eldril Sidewinder",
    cost: 220,
    rules: ['Elven Kingdoms League']
    },
    {name: "Estelle La Veneaux",
    cost: 190,
    rules: ['Lustrian Superleague']
    },
    # {name: "Frank \'n\' Stein",
    # cost: 250,
    # rules: ['Old World Classic', 'Sylvanian Spotlight']
    # },
    {name: "Fungus the Loon",
    cost: 80,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    {name: "Glart Smashrip",
    cost: 175,
    rules: ['Underworld Challenge']
    },
    {name: "Gloriel Summerbloom",
    cost: 150,
    rules: ['Elven Kingdoms League']
    },
    {name: "Glotl Stop",
    cost: 260,
    rules: ['Lustrian Superleague']
    },
    {name: "Grak and Crumbleberry",
    cost: 250,
    rules: ['Any']
    },
    {name: "Grashnak Blackhoof",
    cost: 240,
    rules: ['Chaos Clash']
    },
    {name: "Gretchen Wachter \'The Blood Bowl Widow\'",
    cost:180,
    rules: ['Sylvanian Spotlight']
    },
    {name: "Griff Oberwald",
    cost: 300,
    rules: ['Old World Classic']
    },
    {name: "Grim Ironjaw",
    cost: 200,
    rules: ['Worlds Edge Superleague']
    },
    {name: "Grombrindal, the White Dwarf",
    cost: 270,
    rules: ['Halfing Thimble Cup', 'Old World Classic', 'Worlds Edge Superleague']
    },
    {name: "Guffle Pusmaw",
    cost: 150,
    rules: ['Favoured of Nurgle']
    },
    {name: "H\'thark the Unstoppable (Favoured of Hashut)",
    cost: 300,
    rules: ['Badlands Brawl', "Chaos Clash"]
    },
    {name: "Hakflem Skuttlespike",
    cost: 200,
    rules: ['Underworld Challenge']
    },
    {name: "Helmut Wulf",
    cost: 140,
    rules: ['Old World Classic']
    },
    {name: "Ivan \'the Animal\' Deathshroud",
    cost: 210,
    rules: ['Sylvanian Spotlight']
    },
    {name: "Ivar Eriksson",
    cost: 215,
    rules: ['Old World Classic']
    },
    {name: "Jeremiah Kool",
    cost: 300,
    rules: ['Elven Kingdoms League']
    },
    {name: "Jordell Freshbreeze",
    cost: 280,
    rules: ['Elven Kingdoms League', 'Woodland League']
    },
    {name: "Josef Bugman",
    cost: 180,
    rules: ['Old World Classic', 'Worlds Edge Superleague']
    },
    {name: "Karla Von Kill",
    cost: 210,
    rules: ['Old World Classic', 'Lustrian Superleague']
    },
    {name: "Kiroth Krakeneye",
    cost: 160,
    rules: ['Elven Kingdoms League']
    },
    {name: "Kreek Rustgouger",
    cost: 180,
    rules: ['Underworld Challenge']
    },
    {name: "Lord Borak The Despoiler",
    cost: 270,
    rules: ['Chaos Clash']
    },
    {name: "Maple Highgrove",
    cost: 210,
    rules: ['Woodland League']
    },
    {name: "Max Spleenripper (Favoured of Khorne)",
    cost: 130,
    rules: ['Chaos Clash']
    },
    {name: "Mighty Zug",
    cost: 220,
    rules: ['Old World Classic', 'Lustrian Superleague']
    },
    {name: "Morg \'n\' Thorg",
    cost: 380,
    rules: ['Any']
    },
    {name: "Nobbla Blackwart",
    cost: 120,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    {name: "Puggy Baconbreath",
    cost: 120,
    rules: ['Halfing Thimble Cup', 'Old World Classic']
    },
    {name: "Rashnak Backstabber",
    cost: 130,
    rules: ['Badlands Brawl']
    },
    {name: "Ripper Bolgrot",
    cost: 250,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    {name: "Rodney Roachbait",
    cost: 70,
    rules: ['Woodland League']
    },
    # {name: "Rowana Forestfoot",
    # cost: 160,
    # rules: ['Woodland League']
    # },
    {name: "Roxanna Darknail",
    cost: 270,
    rules: ['Elven Kingdoms League']
    },
    {name: "Rumbelow Sheepskin",
    cost: 170,
    rules: ['Halfling Thimble Cup']
    },
    {name: "Scrappa Sorehead",
    cost: 120,
    rules: ['Badlands Brawl', 'Underworld Challenge']
    },
    {name: "Scyla Anfingrimm (Favoured of Khorne)",
    cost: 200,
    rules: ['Chaos Clash']
    },
    {name: "Skitter Stab-Stab",
    cost: 170,
    rules: ['Underworld Challenge']
    },
    {name: "Skrorg Snowpelt",
    cost: 240,
    rules: ['Old World Classic', 'Worlds Edge Superleague']
    },
    {name: "Skrull Halfheight",
    cost: 150,
    rules: ['Sylvanian Spotlight', 'Worlds Edge Superleague']
    },
    {name: "Lucian and Valen Swift",
    cost: 300,
    rules: ['Elven Kingdoms League']
    },
    {name: "Swiftvine Glimmershard",
    cost: 110,
    rules: ['Woodland League']
    },
    {name: "Thorsson Stoutmead",
    cost: 170,
    rules: ['Old World Classic', 'Worlds Edge Superleague']
    },
    {name: "Varag Ghoul-Chewer",
    cost: 260,
    rules: ['Badlands Brawl']
    },
    {name: "Wilhelm Chaney",
    cost: 220,
    rules: ['Sylvanian Spotlight']
    },
    {name: "Willow Rosebark",
    cost: 160,
    rules: ['Woodland League']
    },
    {name: "Withergrasp Doubledrool (Favoured of Nurgle)",
    cost: 170,
    rules: ['Chaos Clash']
    },
    {name: "Zolcath the Zoat",
    cost: 220,
    rules: ['Lustrian Superleague', 'Elven Kingdoms League']
    },
    {name: "Zzharg Madeye (Favoured of Hashut)",
    cost: 130,
    rules: ['Badlands Brawl', "Chaos Clash"]
    },
  ]

  stars = all_stars. sort_by{ |star| star[:cost] }

  response = []

  # response << "Input: #{table} #{roll}"
  log("#{table} #{roll}")

  case table
  when "weather"
    weather_response = case roll
    when 2
      "2: Sweltering heat\nThe intense heat causes some players to faint! At the end of each drive whilst this weather conditon is in effect, one Coach rolls a D3 and each Coach randomly selects that many of their players that were on the pitch when the Drive ended. The selected players are placed in the Reserves Box and cannot be set up on the pitch for the next Drive."
    when 3
      "3: Very sunny\nThe glorious sunshine makes for a beautiful day, but plays havoc with the passing game! Whenever a player makes a Passing Ability test, apply a -1 modifier to the roll."
    when 4 .. 10
      "4-10: Perfect Conditions\nNot too hot, nor too cold. It's perfect weather for Blood Bowl! There is no additonal effect."
    when 11
      "11: Pouring rain\nThe heavens have opened and the sudden downpour has left the players soaked and the ball rather slippery! Whenever a player attempts to pick up or Catch the ball, or Intercept a Pass Action, they suffer a -1 modifier to the roll."
    when 12
      "12: Blizzard\nThe freezing conditions and swirling snow makes the footing treacherous and drastically impedes a player's vision. Whenever a player attempts to Rush, apply an additional -1 modifier to the roll. Additionally, when a player makes a Pass Action, they may only attempt to make a Quick Pass or a Short Pass."
    else
      "2: Sweltering heat\nThe intense heat causes some players to faint! At the end of each drive whilst this weather conditon is in effect, one Coach rolls a D3 and each Coach randomly selects that many of their players that were on the pitch when the Drive ended. The selected players are placed in the Reserves Box and cannot be set up on the pitch for the next Drive.\n\n3: Very sunny\nThe glorious sunshine makes for a beautiful day, but plays havoc with the passing game! Whenever a player makes a Passing Ability test, apply a -1 modifier to the roll.\n\n4-10: Perfect Conditions\nNot too hot, nor too cold. It's perfect weather for Blood Bowl! There is no additonal effect.\n\n11: Pouring rain\nThe heavens have opened and the sudden downpour has left the players soaked and the ball rather slippery! Whenever a player attempts to pick up or Catch the ball, or Intercept a Pass Action, they suffer a -1 modifier to the roll.\n\n12: Blizzard\nThe freezing conditions and swirling snow makes the footing treacherous and drastically impedes a player's vision. Whenever a player attempts to Rush, apply an additional -1 modifier to the roll. Additionally, when a player makes a Pass Action, they may only attempt to make a Quick Pass or a Short Pass."
    end
    response << weather_response
  when "kickoff", "kick"
    kickoff_response = case roll
    when 2
      "2: Get The Ref!\nEach Team gets a free Bribe Inducement. This Bribe must be used before the end of the game or it is lost."
    when 3
      "3: Time-Out\nIf the kicking team's Turn Marker is on turn 6, 7 or 8 for the half, move both coaches' Turn Marker back one space. Otherwise, move both coaches' Turn Marker forwards one space."
    when 4
      "4: Solid Defence\nThe Coach of the kicking team selects up to D3+3 Open players on their team. The selected players are then removed from the pitch and can be set up again following all the usual restrictions for setting up the team."
    when 5
      "5: High Kick\nOne Open player on the receiving team may immediately be placed in the square the ball is going to land in."
    when 6
      "6: Cheering Fans\nBoth Coaches roll a D6 and add the number of Cheerleaders on their Team Roster. The first Block Action performed during the Coach witrh the highest roll's next turn receives an additional Offensive Assist. If both Coaches roll the same, both will receive this benefit during their next Turn."
    when 7
      "7: Brilliant Coaching\nBoth Coaches roll a D6 and add the number of Assistant Coaches on their Team Roster. The Coach with the highest total, or both Coaches in the result of a tie, immediately gains a free Team Re-roll for the
      Drive ahead. If this free Team Re-roll has not been used by the end of the drive, it is lost."
    when 8
      "8: Changing Weather\nImmediately make a new roll on the Weather Table. If the new result is Perfect Conditions, the ball will scatter (3) in the air before it lands."
    when 9
      "9: Quick Snap\nThe Coach of the receiving team selects up to D3+3 Open players on their team. The selected players may immediately move one square in any direction, even if this takes them into the opposition's half."
    when 10
      "10: Charge!\nThe Coach of the kicking team selects up to D3+3 Open players on their team. The selected players may then be activated one at a time, exactly as if it were their team's Turn, and perform a free Move Action. One of the selected players may instead perform a Blitz Action, one may perform a free Throw Team-mate Action, and one may perform a free Kick Team-Mate Action. If a selected player Falls Over or is Knocked Down during their activation, no further selected players can be activated and the Charge ends."
    when 11
      "11: Dodgy Snack\nBoth Coaches roll a D6. The coach that rolled the lowest, or both coaches in the result of a tie, randomly selects one of their players on the pitch and rolls a D6. On a 2+, the player's pre-drive snack has not gone down well and for the duration of the Drive the player reduces their MA and AV by 1. On a 1, the player's pre-drive snack has violently disagreed with them; place the player in the Reserves box as they spend the rest of the Drive locked in the lavatory!"
    when 12
      "12: Pitch Invasion\nBoth Coaches roll a D6 and add their Fan Factor. The coach that rolled the lowest, or both coaches in the result of a tie, randomly selects D3 of their players on the pitch. The randomly selected players are immediately placed prone and become stunned."
    else
      "2: Get The Ref!\nEach Team gets a free Bribe Inducement. This Bribe must be used before the end of the game or it is lost.\n\n3: Time-Out\nIf the kicking team's Turn Marker is on turn 6, 7 or 8 for the half, move both coaches' Turn Marker back one space. Otherwise, move both coaches' Turn Marker forwards one space.\n\n4: Solid Defence\nThe Coach of the kicking team selects up to D3+3 Open players on their team. The selected players are then removed from the pitch and can be set up again following all the usual restrictions for setting up the team.\n\n5: High Kick\nOne Open player on the receiving team may immediately be placed in the square the ball is going to land in.\n\n6: Cheering Fans\nBoth Coaches roll a D6 and add the number of Cheerleaders on their Team Roster. The first Block Action performed during the Coach witrh the highest roll's next turn receives an additional Offensive Assist. If both Coaches roll the same, both will receive this benefit during their next Turn.\n\n7: Brilliant Coaching\nBoth Coaches roll a D6 and add the number of Assistant Coaches on their Team Roster. The Coach with the highest total, or both Coaches in the result of a tie, immediately gains a free Team Re-roll for the Drive ahead. If this free Team Re-roll has not been used by the end of the drive, it is lost.\n\n8: Changing Weather\nImmediately make a new roll on the Weather Table. If the new result is Perfect Conditions, the ball will scatter (3) in the air before it lands.\n\n9: Quick Snap\nThe Coach of the receiving team selects up to D3+3 Open players on their team. The selected players may immediately move one square in any direction, even if this takes them into the opposition's half.\n\n10: Charge!\nThe Coach of the kicking team selects up to D3+3 Open players on their team. The selected players may then be activated one at a time, exactly as if it were their team's Turn, and perform a free Move Action. One of the selected players may instead perform a Blitz Action, one may perform a free Throw Team-mate Action, and one may perform a free Kick Team-Mate Action. If a selected player Falls Over or is Knocked Down during their activation"
    end
    response << kickoff_response
  when "prayers", "prayer", "nuffle"
    prayers_response = case roll
    when 1
      "1: Treacherous Trapdoor\nEach time a player from either team enters a square containing a Trapdoor for any reason, roll a D6. On a 1, the trapdoor falls open and the player falls through it. Make an Injury Roll for the player exactly as if they had been Pused into the Crowd. If the player was holding the ball, it will Bounce from the Trapdoor square."
    when 2
      "2: Friends with the Ref\nWhenever you Argue the Call, treat any roll of 5 or 6 as \"Well, when you put it like that...\""
    when 3
      "3: Stiletto\nRandomly select one player on your team that is playing this game. The selected player gains the Stab Trait for the duration of the game."
    when 4
      "4: Iron Man\nRandomly select one player on your team that is playing this game. The selected player improves their AV by 1 (to a maximum of 11+) for the duration of the game."
    when 5
      "5: Knuckle Dusters\nRandomly select one player on your team that is playing this game. The selected player gains the Mighty Blow Skill for the duration of the game."
    when 6
      "6: Bad Habits\nRandomly select D3 opposition players that are playing this game. Those players gain the Loner (2+) trait for the duration of the game."
    when 7
      "7: Greasy Cleats\nRandomly select one opposition player that is playing this game. The selected player reduces their MA by 1 (to a minimum of 1) for the duration of the game."
    when 8
      "8: Blessing of Nuffle\nRandomly select one player on your team that is playing this game. The selected player gains the Pro Skill for the duration of the game."
    when 9
      "9: Moles under the Pitch\nOpposition players apply a -1 modifier to the roll when attempting to Rush."
    when 10
      "10: Perfect Passing\nAny player on your team that makes a completion will earn 2 SPP rather than the usual 1."
    when 11
      "11: Dazzling Catching\nAny player on your team that successfully Catches the ball as a result of a Pass Action will earn 1 SPP."
    when 12
      "12: Fan Interaction\nIf an opposition player suffers a Casualty as a result of being Pushed into the Crowd, the player that pushed them into the crowd will earn 2 SPP."
    when 13
      "13: Fouling Frenzy\nAny player on your team that causes a Casualty with a Foul Action will earn 2 SPP."
    when 14
      "14: Throw a Rock\nOnce per game, at the start of any of your Turns before any players are activated, you may randomly select one opposition player on the pitch and roll a D6. On a 4+, an angry fan throws a rock and the selected player is immediately Knocked Down."
    when 15
      "15: Under Scrutiny\nAny opposition player that performs a Foul Action will automatically be Sent-off if they break armour, regardless of whether a natural double is rolled."
    when 16
      "16: Intensive Training\nRandomly select one player on your team that is playing this game. The selected player gains a Single Primary Skill of your choice for the duration of the game."
    else
      "1: Treacherous Trapdoor\nEach time a player from either team enters a square containing a Trapdoor for any reason, roll a D6. On a 1, the trapdoor falls open and the player falls through it. Make an Injury Roll for the player exactly as if they had been Pused into the Crowd. If the player was holding the ball, it will Bounce from the Trapdoor square.\n\n2: Friends with the Ref\nWhenever you Argue the Call, treat any roll of 5 or 6 as \"Well, when you put it like that...\"\n\n3: Stiletto\nRandomly select one player on your team that is playing this game. The selected player gains the Stab Trait for the duration of the game.\n\n4: Iron Man\nRandomly select one player on your team that is playing this game. The selected player improves their AV by 1 (to a maximum of 11+) for the duration of the game.\n\n5: Knuckle Dusters\nRandomly select one player on your team that is playing this game. The selected player gains the Mighty Blow Skill for the duration of the game.\n\n6: Bad Habits\nRandomly select D3 opposition players that are playing this game. Those players gain the Loner (2+) trait for the duration of the game.\n\n7: Greasy Cleats\nRandomly select one opposition player that is playing this game. The selected player reduces their MA by 1 (to a minimum of 1) for the duration of the game.\n\n8: Blessing of Nuffle\nRandomly select one player on your team that is playing this game. The selected player gains the Pro Skill for the duration of the game.\n\n9: Moles under the Pitch\nOpposition players apply a -1 modifier to the roll when attempting to Rush.\n\n10: Perfect Passing\nAny player on your team that makes a completion will earn 2 SPP rather than the usual 1.\n\n11: Dazzling Catching\nAny player on your team that successfully Catches the ball as a result of a Pass Action will earn 1 SPP.\n\n12: Fan Interaction\nIf an opposition player suffers a Casualty as a result of being Pushed into the Crowd, the player that pushed them into the crowd will earn 2 SPP.\n\n13: Fouling Frenzy\nAny player on your team that causes a Casualty with a Foul Action will earn 2 SPP.\n\n14: Throw a Rock\nOnce per game, at the start of any of your Turns before any players are activated, you may randomly select one opposition player on the pitch and roll a D6. On a 4+, an angry fan throws a rock and the selected player is immediately Knocked Down.\n\n15: Under Scrutiny\nAny opposition player that performs a Foul Action will automatically be Sent-off if they break armour, regardless of whether a natural double is rolled.\n\n16: Intensive Training\nRandomly select one player on your team that is playing this game. The selected player gains a Single Primary Skill of your choice for the duration of the game."
    end
    response << prayers_response
  when "casualty"
    casualty_response = case roll
    when 1..8
      "1-8: Badly Hurt\nThe player suffers no long-term effects."
    when 9..10
      "9-10: Seriously hurt\nThe player must miss their next game."
    when 11..12
      "10-12: Serious Injury\nThe player suffers a Niggling Injury and must miss their next game."
    when 13..14
      "13-14: Lasting Injury\nThe player has suffers a Characteristic Reduction and must miss their next game.\n\nRoll a d6 to determine the Characteristic reduced:\n\n1-2 Head injury: -1AV\n3: Smashed knee: -1MA\n4 Broken arm: -1PA\n5 Dislocated hip: -1AG\n6 Broken shoulder: -1ST"
    when 15..16
      "15-16: Dead!\nThe player is dead!"
    else
      "1-8: Badly Hurt\nThe player suffers no long-term effects.\n\n9-10: Seriously hurt\nThe player must miss their next game.\n\n10-12: Serious Injury\nThe player suffers a Niggling Injury and must miss their next game.\n\n13-14: Lasting Injury\nThe player has suffers a Characteristic Reduction and must miss their next game.\n\nRoll a d6 to determine the Characteristic reduced:\n\n1-2 Head injury: -1AV\n3: Smashed knee: -1MA\n4 Broken arm: -1PA\n5 Dislocated hip: -1AG\n6 Broken shoulder: -1ST\n\n15-16: Dead!\nThe player is dead!"
    end
    response << casualty_response
  when "injury"
    injury_response = case roll
    when 2..6
      "2-7: Stunned\nThe player is immediately Stunned."
    when 7
      "7: Stunned\nThe player is immediately Stunned.\n\nIf the player has the Stunty trait, they are instead immediately Knocked out. Remove them from the pitch and place them in the Knocked-out box of their Dugout."
    when 8
      "8-9: Knocked out\nThe player is immediately Knocked out. Remove them from the pitch and place them in the Knocked-out box of their Dugout."
    when 9
      "9: Knocked out\nThe player is immediately Knocked out. Remove them from the pitch and place them in the Knocked-out box of their Dugout.\n\nIf the player has the Stunty trait, they are instead Badly hurt. Remove them from the pitch and place them in the Casualty box of their Dugout. In League Play, no Casualty Roll is made for them, instead they automatically suffer the Badly Hurt result on the Casualty Table."
    when 10..12
      "10-12: Casualty\nThe player suffers a Casualty. Remove them from the pitch and place them in the Casualty box of their Dugout. The Coach of the opposing team then makes a Casualty Roll against them."
    else
      "2-7: Stunned\nThe player is immediately Stunned\n\n.8-9: Knocked out\nThe player is immediately Knocked out. Remove them from the pitch and place them in the Knocked-out box of their Dugout.\n\n10-12: Casualty\nThe player suffers a Casualty. Remove them from the pitch and place them in the Casualty box of their Dugout. The Coach of the opposing team then makes a Casualty Roll against them."
    end
    response << injury_response


  when "lustria", "lustrian", "lustriansuperleague", "lsl"
    available_stars = find_available_stars(stars, roll, "Lustrian Superleague", "Any")
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end
  when "badlands", "badlandsbrawl", "bb"
    available_stars = find_available_stars(stars, roll, "Badlands Brawl", "Any")
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end
  when "chaos", "chaosclash", "cc"
    available_stars = find_available_stars(stars, roll, "Chaos Clash", "Any")
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end
  when "elven", "elves", "elvenkingdoms", "elvenkingdomsleague", "elf", "ekl"
    available_stars = find_available_stars(stars, roll, "Elven Kingdoms League", "Any")
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end
  when "worldsedge", "worldsedgesuperleague", "wesl", "wes", "wsl"
    available_stars = find_available_stars(stars, roll, "Worlds Edge Superleague", "Any")
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end
  when "halflingthimblecup", "htc", "thimblecup", "thimble", "halflingcup", "tc"
      available_stars = find_available_stars(stars, roll, "Halfling Thimble Cup", "Any")
      if available_stars.nil? || available_stars.empty?
        response << "No available stars for this selection."
      else
        response << "Available Stars: \n#{available_stars}"
      end
  when "woodlandleague", "woodland", "wl", "forest"
      available_stars = find_available_stars(stars, roll, "Woodland League", "Any")
      if available_stars.nil? || available_stars.empty?
        response << "No available stars for this selection."
      else
        response << "Available Stars: \n#{available_stars}"
      end
  when "underworldchallenge", "uwc", "underworldchallenge", "underworld"
      available_stars = find_available_stars(stars, roll, "Underworld Challenge", "Any")
      if available_stars.nil? || available_stars.empty?
        response << "No available stars for this selection."
      else
        response << "Available Stars: \n#{available_stars}"
      end
  when "oldworldclassic", "owc", "classic", "oldworld"
      available_stars = find_available_stars(stars, roll, "Old World Classic", "Any")
      if available_stars.nil? || available_stars.empty?
        response << "No available stars for this selection."
      else
        response << "Available Stars: \n#{available_stars}"
      end
  when "sylvanianspotlight", "sylvanian", "spotlight", "ss", "undead"
      available_stars = find_available_stars(stars, roll, "Sylvanian Spotlight", "Any")
      if available_stars.nil? || available_stars.empty?
        response << "No available stars for this selection."
      else
        response << "Available Stars: \n#{available_stars}"
      end

    available_stars = find_available_stars(stars, roll, "Favoured of Hashut", "Badlands Brawl", "Any", response)
    if available_stars.nil? || available_stars.empty?
      response << "No available stars for this selection."
    else
      response << "Available Stars: \n#{available_stars}"
    end

  else
      response << "Please send a message in the format \"[table] [number]\".\n\nAvailable tables are:\nweather\nkickoff\nprayers\ninjury\ncasualty\nbadlands (bb)\nchaos (cc)\nelven (ekl)\nlustria (ls)\nworldsedge (wes)\nthimblecup (htc)\nwoodland (wl)\nunderworld (uwc)\noldworld (owc)\nsylvanian (ss)\n\nThe number should either be the value rolled on a table or the available inducement money for a team.\n\nFor example, send \"weather 6\" or \"owc 180\". If no roll value is given, the full table will be shown."
  end

  return response.join("\n")
end



def find_available_stars(stars, roll, *rules)
  roll = roll.to_i
  return "Invalid roll" if roll <= 0
  available_stars = stars.select do |star|
    star[:cost] <= roll &&
    rules.any? { |rule| star[:rules].include?(rule) &&
    !(star[:name] == "Morg 'n' Thorg" && rules.include?("Sylvanian Spotlight"))

    }
  end
  available_stars.empty? ? "No available stars for this selection." : available_stars.map { |star| "#{star[:name]}: #{star[:cost]}k" }.join("\n")
end


def send_bot_message(message, client, event)
  # Log prints for debugging
  p 'Bot message sent!'
  p event['replyToken']
  p client

  message = { type: 'text', text: message }
  p message

  client.reply_message(event['replyToken'], message)
  'OK'
end

get '/' do
  "Chelmsford City for the Chaos Cup"
end

post '/callback' do
  body = request.body.read

  # signature = request.env['HTTP_X_LINE_SIGNATURE']
  # unless client.validate_signature(body, signature)
  #   error 400 do 'Bad Request' end
  # end
  signature = request.env['HTTP_X_LINE_SIGNATURE']

  unless ENV['SKIP_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end

  events = client.parse_events_from(body)
  events.each do |event|
    p event
    # Focus on the message events (including text, image, emoji, vocal.. messages)
    next if event.class != Line::Bot::Event::Message

    case event.type
    # when receive a text message
    when Line::Bot::Event::MessageType::Text
      # user_id = event['source']['userId']
      # response = client.get_profile(user_id)
      # if response.class == Net::HTTPOK
      #   contact = JSON.parse(response.body)
      #   p contact
      # else
      #   # Can't retrieve the contact info
      #   p "#{response.code} #{response.body}"
      # end

      user_id = event['source']['userId']

      contact =
        if ENV['LINE_CHANNEL_TOKEN']
          response = client.get_profile(user_id)
          if response.is_a?(Net::HTTPOK)
            JSON.parse(response.body)
          else
            p "#{response.code} #{response.body}"
            nil
          end
        else
          { "displayName" => "Test User" }
        end

      p contact

      # end test

      if event.message['text'].downcase == 'hello, world'
        # Sending a message when LINE tries to verify the webhook
        send_bot_message(
          'Everything is working!',
          client,
          event
        )
      else
        # The answer mechanism is here!
        message_parts = event.message['text'].downcase.split
        if message_parts.length == 2
          table = message_parts[0]
          roll = message_parts[1].to_i
          send_bot_message(
            bot_answer_to(table, roll),
            client,
            event
          )
        elsif message_parts.length == 1
          table = message_parts[0]
          roll = nil
          send_bot_message(
            bot_answer_to(table, roll),
            client,
            event
          )
        else
          send_bot_message(
            "Please send a message in the format \"[table] [number]\"\n\n.Available tables are: weather, kickoff, prayers, injury, casualty, chaosclash (cc), elvenkingdomsleague (ekl), lustriansuperleague (lsl), worldsedgesuperleague (wesl), halflingthimblecup (htc), woodlandleague (wl), underworldchallenge (uwc), oldworldclassic (owc), sylvanianspotlight (ss).\n\n For referencing tables, the number should be the roll on the table. For checking available stars, the number should be the available inducement money.\n\nFor example, send \"weather 6\" or \"owc 180\". Rolls which are not available on a table (eg. \"weather 16\" will result in the full table being displayed).",
            client,
            event
          )
        end
      end
    end
  end
end

post '/test-message' do
  payload = JSON.parse(request.body.read)

  text = payload["text"]
  halt 400, "Missing text" unless text

  parts = text.downcase.split
  if parts.length == 2
    bot_answer_to(parts[0], parts[1].to_i)
  elsif parts.length == 1
    bot_answer_to(parts[0], nil)
  else
    "Invalid format"
  end
end
