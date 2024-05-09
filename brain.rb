def bot_answer_to(table, roll)
  case table
  when "weather"
    case roll
    when 2
      "2: Sweltering heat\nIt's so hot and humid that some players collapse from heat exhaustion. Roll a D6 for each player on the pitch at the end of a drive. On a roll of 1 the player collapses and may not be set up for the next kick-off."
    when 3
      "3: Very sunny\nA glorious day, but the blinding sunshine causes a -1 modifier on all passing rolls."
    when 4 .. 10
      "4-10: Perfect Conditions\nNeither too cold nor too hot. A warm, dry and slightly overcast day provides perfect conditions to Blood Bowl."
    when 11
      "11: Pouring rain\nIt's raining, making the ball slippery and difficult to hold. A -1 modifier applies to all catch, intercept, or pick-up rolls."
    when 12
      "12: Blizzard\nIt's cold and snowing! The ice on the pitch means that any player attempting to move an extra square (GFI) will slip and be Knocked Down on a roll of 1-2, while the snow means that only quick or short passes can be attempted."
    else
      "2: Sweltering heat\nIt's so hot and humid that some players collapse from heat exhaustion. Roll a D6 for each player on the pitch at the end of a drive. On a roll of 1 the player collapses and may not be set up for the next kick-off.\n3: Very sunny\nA glorious day, but the blinding sunshine causes a -1 modifier on all passing rolls.\n4-10: Perfect Conditions\nNeither too cold nor too hot. A warm, dry and slightly overcast day provides perfect conditions to Blood Bowl.\n11: Pouring rain\nIt's raining, making the ball slippery and difficult to hold. A -1 modifier applies to all catch, intercept, or pick-up rolls.\n12: Blizzard\nIt's cold and snowing! The ice on the pitch means that any player attempting to move an extra square (GFI) will slip and be Knocked Down on a roll of 1-2, while the snow means that only quick or short passes can be attempted."
    end
  when"spring"
    case roll
    when 2
      "2: Morning Dew\nThe pitch is dew-covered from the cold of night, making everything a little slippery. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, apply a -1 modifier every time a player makes an Agility test to pick up the ball."
    when 3
      "3: Blossoming Flowers\nThe flowers are blooming, the tree sap is pumping and the pollen count is high, forcing the hay fever-afflicted referee to seek shelter indoors. Whilst this weather condition is in effect, players cannot be Sent-off for committing a Foul, even if they roll a natural double on either the Armour roll or the Injury roll."
    when 4 .. 10
      "4-10: Perfect Conditions\nIt's not quite warm but then again, it's not quite cold - ideal weather for a game of Blood Bowl!"
    when 11
      "11: Misty Morning\nA haze of thick mist has descended upon the pitch, greatly reducing visibility. Players can move only a maximum of six squares, although they may still Rush as normal. Additionally, only Quick and Short pass actions can be performed."
    when 12
      "12: High Winds\nThe winds are whistling through the stadium and the players can barely hear each other. Roll a D6 each time a player on your team wishes to use a team re-roll. On a roll of 2+, you may use a team re-roll as normal. On a 1, a team re-roll cannot be used."
    else
      "2: Sweltering heat\nIt's so hot and humid that some players collapse from heat exhaustion. Roll a D6 for each player on the pitch at the end of a drive. On a roll of 1 the player collapses and may not be set up for the next kick-off.\n3: Very sunny\nA glorious day, but the blinding sunshine causes a -1 modifier on all passing rolls.\n4-10: Perfect Conditions\nNeither too cold nor too hot. A warm, dry and slightly overcast day provides perfect conditions to Blood Bowl.\n11: Pouring rain\nIt's raining, making the ball slippery and difficult to hold. A -1 modifier applies to all catch, intercept, or pick-up rolls.\n12: Blizzard\nIt's cold and snowing! The ice on the pitch means that any player attempting to move an extra square (GFI) will slip and be Knocked Down on a roll of 1-2, while the snow means that only quick or short passes can be attempted."
    end
  when "summer"
    case roll
    when 2
      "2: Sweltering Heat\nSome players faint in the unbearable heat! D3 randomly selected players from each team that are on the pitch when a drive ends are placed in the Reserves box. They must miss the next drive."
    when 3
      "3: Melting Astrogranite\nIt's not just the players that are affected by the hot weather - even the pitch is melting! It might be the heat, or it might be the sticky footing, but the players are certainly struggling to move! The number of squares a player can attempt to Rush is reduced by one (to a minimum of one)."
    when 4 .. 10
      "4-10: Perfect Conditions\nIt's still hot, but not as hot as it has been lately! A (tolerably) warm, dry and slightly overcast day provides perfect conditions for Blood Bowl."
    when 11
      "11: Blinding Rays\nNo cloud cover in the clear, blue skies and the relentless glare of the sun leaves the players squinting and shading their eyes. Apply a -1 modifier every time a player tests against their Passing Ability. Additionally, only Quick and Short pass actions can be performed."
    when 12
      "12: Monsoon\nA sudden burst of torrential rain and high winds hits the pitch, making the ball slippery and erratic. Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass. Additionally, when the ball scatters, it moves from the square in which it was placed four times before landing, rather than the usual three."
    else
      "2: Sweltering Heat\nSome players faint in the unbearable heat! D3 randomly selected players from each team that are on the pitch when a drive ends are placed in the Reserves box. They must miss the next drive.\n3: Melting Astrogranite\nIt's not just the players that are affected by the hot weather - even the pitch is melting! It might be the heat, or it might be the sticky footing, but the players are certainly struggling to move! The number of squares a player can attempt to Rush is reduced by one (to a minimum of one).4-10: Perfect Conditions\nIt's still hot, but not as hot as it has been lately! A (tolerably) warm, dry and slightly overcast day provides perfect conditions for Blood Bowl.\n11: Blinding Rays\nNo cloud cover in the clear, blue skies and the relentless glare of the sun leaves the players squinting and shading their eyes. Apply a -1 modifier every time a player tests against their Passing Ability. Additionally, only Quick and Short pass actions can be performed.\n12: Monsoon\nA sudden burst of torrential rain and high winds hits the pitch, making the ball slippery and erratic. Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass. Additionally, when the ball scatters, it moves from the square in which it was placed four times before landing, rather than the usual three."
    end
  when "autumn"
    case roll
    when 2
      "2: Leaf-strewn Pitch\nHuge drifts of leaves have piled up at regular intervals across the pitch. It looks terrible, but they're soft to land on! When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a -1 modifier when making an Armour roll against them."
    when 3
      "3: Autumnal Chill\nWinter is fast approaching and players are reluctant to leave the comfortable warmth of the dugout. During the End of Drive sequence, apply a -1 modifier when rolling to see if a player recovers from being KO'd."
    when 4 .. 10
      "4-10: Perfect Conditions\nIt's not quite warm, but then again it's not quite cold - ideal Blood Bowl weather! A pleasant autumn afternoon provides perfect conditions for Blood Bowl."
    when 11
      "11: Pouring Rain\nA torrential downpour leaves the players soaked and the ball very slippery! Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass."
    when 12
      "12: Strong Winds\nIf it wasn't for the winds, it would be a lovely day. The ball does not deviate normally. Instead, after placing the kick, the coach of the kicking team rolls a D8 to determine the direction in which the wind is blowing: D8 - WIND DIRECTION 1-2 Towards the kicking team's End Zone. 3-4 Towards the receiving team's End Zone. 5-6 Towards the Sideline to the left of the kicking team. 7-8 Towards the Sideline to the right of the kicking team. Next, place the Throw-in template over the square in which the kick was placed, with the central arrow (3-4) pointing in the direction in which the wind is blowing. The kick then deviates in a direction determined by rolling a D6 and referring to the Throw-in template. Additionally, the number of squares the ball moves is determined by rolling a D8, rather than a D6."
    else
      "2: Leaf-strewn Pitch\nHuge drifts of leaves have piled up at regular intervals across the pitch. It looks terrible, but they're soft to land on! When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a -1 modifier when making an Armour roll against them.\n3: Autumnal Chill\nWinter is fast approaching and players are reluctant to leave the comfortable warmth of the dugout. During the End of Drive sequence, apply a -1 modifier when rolling to see if a player recovers from being KO'd.\n4-10: Perfect Conditions\nIt's not quite warm, but then again it's not quite cold - ideal Blood Bowl weather! A pleasant autumn afternoon provides perfect conditions for Blood Bowl.\n11: Pouring Rain\nA torrential downpour leaves the players soaked and the ball very slippery! Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass.\n12: Strong Winds\nIf it wasn't for the winds, it would be a lovely day. The ball does not deviate normally. Instead, after placing the kick, the coach of the kicking team rolls a D8 to determine the direction in which the wind is blowing: D8 - WIND DIRECTION 1-2 Towards the kicking team's End Zone. 3-4 Towards the receiving team's End Zone. 5-6 Towards the Sideline to the left of the kicking team. 7-8 Towards the Sideline to the right of the kicking team. Next, place the Throw-in template over the square in which the kick was placed, with the central arrow (3-4) pointing in the direction in which the wind is blowing. The kick then deviates in a direction determined by rolling a D6 and referring to the Throw-in template. Additionally, the number of squares the ball moves is determined by rolling a D8, rather than a D6."
    end
  when "winter"
    case roll
    when 2
      "2: Cold Winds\nThe fans are shivering in the stands as a viciously cold wind blows steadily down the pitch. Apply a -1 modifier every time a player tests against their Passing Ability. Players also find it harder to get motivated and get back on the pitch. Additionally, during Step 2 of the End of Drive sequence, apply a -1 modifier when rolling to see if any player in the Knockedout box recovers."
    when 3
      "3: Freezing\nA sudden cold snap turns the ground as hard as granite (and not the 'astro' variety that players are used to). When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a +1 modifier when making an Armour roll against them."
    when 4 .. 10
      "4-10: Perfect Conditions\nIt's rather chilly and it's threatening to rain (or snow), but considering the time of year, the conditions are almost perfect for Blood Bowl."
    when 11
      "11: Heavy Snow\nFreezing conditions and heavy falls of snow make the footing treacherous. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, the poor visibility means that only Quick and Short passes can be attempted."
    when 12
      "12: Blizzard\nFreezing conditions and heavy falls of snow make the footing treacherous. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, the poor visibility means that only Quick and Short passes can be attempted."
    else
      "2: Leaf-strewn Pitch\nHuge drifts of leaves have piled up at regular intervals across the pitch. It looks terrible, but they're soft to land on! When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a -1 modifier when making an Armour roll against them.\n3: Autumnal Chill\nWinter is fast approaching and players are reluctant to leave the comfortable warmth of the dugout. During the End of Drive sequence, apply a -1 modifier when rolling to see if a player recovers from being KO'd.\n4-10: Perfect Conditions\nIt's not quite warm, but then again it's not quite cold - ideal Blood Bowl weather! A pleasant autumn afternoon provides perfect conditions for Blood Bowl.\n11: Pouring Rain\nA torrential downpour leaves the players soaked and the ball very slippery! Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass.\n12: Strong Winds\nIf it wasn't for the winds, it would be a lovely day. The ball does not deviate normally. Instead, after placing the kick, the coach of the kicking team rolls a D8 to determine the direction in which the wind is blowing: D8 - WIND DIRECTION 1-2 Towards the kicking team's End Zone. 3-4 Towards the receiving team's End Zone. 5-6 Towards the Sideline to the left of the kicking team. 7-8 Towards the Sideline to the right of the kicking team. Next, place the Throw-in template over the square in which the kick was placed, with the central arrow (3-4) pointing in the direction in which the wind is blowing. The kick then deviates in a direction determined by rolling a D6 and referring to the Throw-in template. Additionally, the number of squares the ball moves is determined by rolling a D8, rather than a D6."
    end
  when "kickoff"
    case roll
    when 2
      "2: Get The Ref!\nEach Team gets a free bribe Inducement as described on page 91. This Inducement must be used before the end of the game or it is lost."
    when 3
      "3: Time-Out\nIf the kicking team's turn marker is on turn 6, 7 or 8 for the half, both coaches move their turn marker back one space. Otherwise, both coaches move their turn marker forward one space.      when 4 .. 10"
    when 4
      "4: Solid Defense\nD3+3 Open players on the kicking team may be removed and setup again in different locations, following all of the usual set-up rules."
    when 5
      "5: High Kick\nOne open player on the receiving team may be moved any number of squares, regardless of their MA, and placed in the same square the ball will land in."
    when 6
      "6: Cheering Fans\nBoth Coaches roll a D6 and add the number of cheerleaders on their Team Draft list. The coach with the highest total may immediately roll once on the Prayers of Nuffle table, in the case of a tie, neither coach rolls on the Prayers of Nuffle table. Note that if you roll a result that is currently in effect, you must re-roll it. However, if you roll a result that has been rolled previously but has since expired, there is no need to re-roll."
    when 7
      "7: Brilliant Coaching\nBoth coaches roll a D6 and add the number of assistant coaches on their Team Draft list. The coach with the highest total gains one extra team re-roll for the drive ahead. If this team re-roll is not used before the end of this drive, it is lost. In the case of a tie, neither coach gains an extra re-roll."
    when 8
      "8: Changing Weather\nMake a new roll on the Weather table and apply result. If the weather conditions are \'Perfect Conditions\' as a result of this roll, the ball will scatter, as described on page 25, before landing."
     when 9
      "9: Quick Snap\nD3+3 Open players on the receiving team may immediately move one square in any direction."
     when 10
      "10: Blitz\nD3+3 Open players on the kicking team may immediately activate to perform a Move action. One may perform a Blitz action and one may perform a Throw Team-mate action. If a player Falls over or is Knocked Down, no further players can be activated and the Blitz ends immediately."
    when 11
      "11: Officious Ref\nBoth coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects one of their players from among those on the pitch, in the case of a tie, both coaches randomly select a player. Roll a D6 for the selected player(s), On a roll of 2+, the player and the referee argue and come to blows, The player is Placed Prone and becomes Stunned. On a roll of 1 however, the player is immediately Sent-Off."
    when 12
      "12: Pitch Invasion\nBoth coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects D3 of their players from among those on the pitch, in the case of a tie, both coaches randomly select D3 players from among those on the pitch. Roll a D6 for the selected player(s), All of the randomly selected players are placed prone and become stunned."
    else
      "2: Get The Ref!\nEach Team gets a free bribe Inducement as described on page 91. This Inducement must be used before the end of the game or it is lost.\n3: Time-Out\nIf the kicking team's turn marker is on turn 6, 7 or 8 for the half, both coaches move their turn marker back one space. Otherwise, both coaches move their turn marker forward one space.\n4: Solid Defense\nD3+3 Open players on the kicking team may be removed and setup again in different locations, following all of the usual set-up rules.\n5: High Kick\nOne open player on the receiving team may be moved any number of squares, regardless of their MA, and placed in the same square the ball will land in.\n6: Cheering Fans\nBoth Coaches roll a D6 and add the number of cheerleaders on their Team Draft list. The coach with the highest total may immediately roll once on the Prayers of Nuffle table, in the case of a tie, neither coach rolls on the Prayers of Nuffle table. Note that if you roll a result that is currently in effect, you must re-roll it. However, if you roll a result that has been rolled previously but has since expired, there is no need to re-roll.\n7: Brilliant Coaching\nBoth coaches roll a D6 and add the number of assistant coaches on their Team Draft list. The coach with the highest total gains one extra team re-roll for the drive ahead. If this team re-roll is not used before the end of this drive, it is lost. In the case of a tie, neither coach gains an extra re-roll.\n8: Changing Weather\nMake a new roll on the Weather table and apply result. If the weather conditions are \'Perfect Conditions\' as a result of this roll, the ball will scatter, as described on page 25, before landing.\n9: Quick Snap\nD3+3 Open players on the receiving team may immediately move one square in any direction.\n10: Blitz\nD3+3 Open players on the kicking team may immediately activate to perform a Move action. One may perform a Blitz action and one may perform a Throw Team-mate action. If a player Falls over or is Knocked Down, no further players can be activated and the Blitz ends immediately.\n11: Officious Ref\nBoth coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects one of their players from among those on the pitch, in the case of a tie, both coaches randomly select a player. Roll a D6 for the selected player(s), On a roll of 2+, the player and the referee argue and come to blows, The player is Placed Prone and becomes Stunned. On a roll of 1 however, the player is immediately Sent-Off.\n12: Pitch Invasion\nBoth coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects D3 of their players from among those on the pitch, in the case of a tie, both coaches randomly select D3 players from among those on the pitch. Roll a D6 for the selected player(s), All of the randomly selected players are placed prone and become stunned."
    end
  when "prayers"
    case roll
    when 1
      "1: Treacherous Trapdoor\nUntil the end of the half, any player who lands on a Trapdoor rolls 1D6. On 1, he is considered pushed into the Public. If he was carrying the ball, it bounces."
    when 2
      "2: Friends with the Ref\nUntil the end of the Phase, argue results are treated as 2-4 and 5-6 instead of 2-5 and 6."
    when 3
      "3: Stiletto\nRandomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Stab trait."
    when 4
      "4: Iron Man\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player improves their AV by 1, to a maximum of 11+."
    when 5
      "5: Knuckle Dusters\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Mighty Blow (+1) skill."
    when 6
      "6: Bad Habits\nRandomly select D3 opposition players that are available to play during this drive and do not have the Loner (X+) trait. Until the end of this drive, those players gain the Loner (2+) trait."
    when 7
      "7: Greasy Cleats\nRandomly select one opposition player that is available to play during this drive. That player has had their boots tampered with! until the end of this drive, their MA is reduced by 1."
    when 8
      "8: Blessed Statue of Nuffle\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains the Pro skill."
    when 9
      "9: Moles under the Pitch\nUntil the end of this half, apply a -1 modifier every time any player attempts to Rush an extra square (-2 should it occour that both coaches have rolled this result)."
    when 10
      "10: Perfect Passing\nUntil the end of this game, any player on your team that makes a completion earns 2 SPP, rather than the usual 1 SPP."
    when 11
      "11: Fan Interaction\nUntil the end of this drive, if a player on your team causes a Casualty by pushing an opponent into the crowd, that player will earn 2 SPP exactly as if they had caused a Casualty by performing a Block action."
    when 12
      "12: Necessary Violence\nUntil the end of this drive, any player on your team that causes a Casualty earns 3 SPP, rather than the usual 2 SPP."
    when 13
      "13: Fouling Frenzy\nUntil the end of this drive, any player on your team that causes a Casualty with a Foul action earns 2 SPP exaclty as if they had caused a Casualty by performing a Block action."
    when 14
      "14: Throw a Rock\nUntil the end of this drive, should an opposition player Stall, at the end of their team turn you may roll a D6. On a roll of 5+, an angry fan throws a rock at that player. The player is immediately Knocked Down."
    when 15
      "15: Under Scrutiny\nUntil the end of this half, any player on the opposing team that commits a Foul action is automatically seen by the referee, even if a natural double is not rolled."
    when 16
      "16: Intensive Training\nRandomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains a Single Primary skill of choice."
    else
      "1: Treacherous Trapdoor\nUntil the end of the half, any player who lands on a Trapdoor rolls 1D6. On 1, he is considered pushed into the Public. If he was carrying the ball, it bounces.\n2: Friends with the Ref\nUntil the end of the Phase, argue results are treated as 2-4 and 5-6 instead of 2-5 and 6.\n3: Stiletto\nRandomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Stab trait.\n4: Iron Man\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player improves their AV by 1, to a maximum of 11+.\n5: Knuckle Dusters\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Mighty Blow (+1) skill.\n6: Bad Habits\nRandomly select D3 opposition players that are available to play during this drive and do not have the Loner (X+) trait. Until the end of this drive, those players gain the Loner (2+) trait.\n7: Greasy Cleats\nRandomly select one opposition player that is available to play during this drive. That player has had their boots tampered with! until the end of this drive, their MA is reduced by 1.\n8: Blessed Statue of Nuffle\nChoose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains the Pro skill.\n9: Moles under the Pitch\nUntil the end of this half, apply a -1 modifier every time any player attempts to Rush an extra square (-2 should it occour that both coaches have rolled this result).\n10: Perfect Passing\nUntil the end of this game, any player on your team that makes a completion earns 2 SPP, rather than the usual 1 SPP.\n11: Fan Interaction\nUntil the end of this drive, if a player on your team causes a Casualty by pushing an opponent into the crowd, that player will earn 2 SPP exactly as if they had caused a Casualty by performing a Block action.\n12: Necessary Violence\nUntil the end of this drive, any player on your team that causes a Casualty earns 3 SPP, rather than the usual 2 SPP.\n13: Fouling Frenzy\nUntil the end of this drive, any player on your team that causes a Casualty with a Foul action earns 2 SPP exaclty as if they had caused a Casualty by performing a Block action.\n14: Throw a Rock\nUntil the end of this drive, should an opposition player Stall, at the end of their team turn you may roll a D6. On a roll of 5+, an angry fan throws a rock at that player. The player is immediately Knocked Down.\n15: Under Scrutiny\nUntil the end of this half, any player on the opposing team that commits a Foul action is automatically seen by the referee, even if a natural double is not rolled.\n16: Intensive Training\nRandomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains a Single Primary skill of choice."
  end
  else
    "ERROR ERROR DOES NOT COMPUTE"
  end
end

message_parts = gets.chomp.downcase.split
if message_parts.length == 2
  table = message_parts[0]
  roll = message_parts[1].to_i
elsif message_parts.length == 1
  table = message_parts[0]
  roll = nil
else
  send_bot_message(
    'Please send a message in the format "[table] [number]". For example, send "summer 6". For the full summer table, send "summer". The available tables are weather, spring, summer, autumn, winter, kickoff, and prayers.',
    client,
    event
  )
end

puts bot_answer_to(table, roll)
